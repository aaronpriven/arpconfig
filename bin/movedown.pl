#!/usr/bin/env perl

use 5.024;
use warnings;

use Path::Class;

my $rootname = '.';

my $root = dir($rootname);

my $movedir = dir("$rootname/../moved");

my $sub = sub {

    my $path = shift;
    return if "$path" eq '.';
    if ( $path->is_dir ) {
        $path->remove unless scalar $path->children;
        return;
    }

    my $basename = $path->basename;
    my $left     = substr( $basename, 0, 1 );
    if ( $left =~ /[0-9]/ ) {
        $left = "${left}_";
    }
    elsif ( $left !~ /[A-Za-z]/ ) {
        $left = "Symbol_";
    }

    my $count = 0;

    while (1) {

        my $dispcount = $left . ( $count == 0 ? '' : $count );
        my $newpath   = $movedir->subdir( $left . $count );
        mkdir $newpath unless ( -d $newpath );
        my $newfile = $newpath->file("$basename");

        if ( not( -e $newfile ) ) {
            rename $path, $newfile or warn "$!: '$newfile'";
            return;
        }

        $count++;
        next;

    }

};

$root->recurse( callback => $sub, depthfirst => 1, preorder => 0 );

