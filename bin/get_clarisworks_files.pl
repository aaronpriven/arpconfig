#!/usr/bin/env perl

use 5.022;

use Path::Tiny;

my $root = path(".");

my %desc_of_type = qw/
  CWGR Drawing
  CWPT Painting
  CWSS Spreadsheet
  CWPR Presentation
  CWDB Database
  CWWP Word Processing
  /;

my %files_of_type;

check($root);
# recursive subroutine

sub check {
    print STDERR ".";
    my $tocheck = shift;

    my $iter = $tocheck->iterator;
    while ( my $path = $iter->() ) {

        if ( -d $path ) {
            #say "*** $path";
            check($path);
        }
        else {

            my $type    = `/usr/bin/GetFileInfo -t "$path"`;
            my $creator = `/usr/bin/GetFileInfo -c "$path"`;
            chomp $type;
            chomp $creator;
            $type    =~ s/"//g;
            $creator =~ s/"//g;
            next unless $desc_of_type{$type} or $creator eq 'BOBO';

            my $fullpath = $path->absolute;
            #say qq[$creator\t$type\t"$fullpath"];

            push @{ $files_of_type{$type} }, [ $creator, $type, $fullpath ];
        }

    }

}

say STDERR ".";

foreach my $type ( sort keys %files_of_type ) {
    open my $out, '>', "$type-list.txt" or die $!;

    my @entries = $files_of_type{$type}->@*;

    @entries = sort { $_->[2] } @entries;

    foreach my $entry (@entries) {
        say $out qu($entry->[2]);
        say join("\t" , $entry->@*);
    }

    close $out;

}

sub qu {
    my $val = shift;
   return qq{"$val",};
   }

