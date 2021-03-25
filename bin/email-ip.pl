#!/usr/bin/perl

use strict;
use warnings;

my $ip = `ipconfig getifaddr en0`;
$ip =~ s/\s//g;

my $file = $ENV{'HOME'} . '/.email-ip';

my $hostname = `hostname`;
chomp $hostname;
$hostname =~ s/\.local\z//;

my $oldip;

if ( open (my $in , '<' , $file) ) {
      $oldip = <$in>;
      close $in;
} else 
{ 
   $oldip = '0.0.0.0';
}

print "[[$ip]]\t[[$hostname]]\t[[$file]]\t[[$oldip]]\n";

if ($oldip ne $ip) {
   open (my $out , '>' , $file ) 
      or die "Can't open .email-ip for writing: $!";
   print $out $ip;
   close $out;

   my $command = "/usr/bin/mail -s 'email-ip: $hostname is $ip' apriven\@actransit.org";

   print "$command\n";

   open (my $mail , '|-' ,  $command) or die "Can't open mail: $!";
   print $mail `ifconfig -a`;
   close $mail;

}

