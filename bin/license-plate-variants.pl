#!/ActivePerl/bin/perl
#
# Get number of license plates without three-letter runs

use 5.012;
use strict;
use Algorithm::Combinatorics qw(variations_with_repetition);

my %chars_of = qw<d 10 l 24>;
# I and O not valid

my $var_iter = variations_with_repetition ([keys %chars_of],7);

my $total;
my @perms;
while (my $perm_r = $var_iter->next) {
   my $perm = join('', @$perm_r);
   next if $perm =~ /lll/;
   my $quantity = quantity($perm);
   $total += $quantity;
   say "$perm: " , commify($quantity);
}

say "TOTAL: " , commify($total);

sub commify {
      local $_  = shift;
      1 while s/^(-?\d+)(\d{3})/$1,$2/;
      return $_;

}

sub quantity {

   my @chars = split (//, shift);

   my $result = 1;
   
   foreach my $char (@chars) {
      $result *= $chars_of{$char};
   }

   return $result;

}


