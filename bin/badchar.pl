#!/usr/bin/env perl

use 5.024;
use warnings;

use Path::Class;

my $rootname = shift @ARGV // '.';

my $root = dir($rootname);

my $sub = sub {

    my $path = shift;
    return if "$path" eq '.';
    my $parent = $path->parent;
    my $basename = $path->basename;
    my $newname = $basename =~ s/^ +/\! /r;
    $newname =~ s/[. ]+$//;
    $newname =~ s/[<>:"\/\\\|\?\*]+/-/g;
    $newname =~ s/\t/ /g;

    return if $basename eq $newname;

    my $newfile = $parent->file($newname);

    if (-e $newfile) { 
      warn "can't rename $path $newname already exists\n";
      return;
   }

    rename $path, $newfile;
    say "$parent\n\t[$basename] => [$newname]";

#    < (less than)
#> (greater than)
#: (colon)
#" (double quote)
#/ (forward slash)
#\ (backslash)
#| (vertical bar or pipe)
#? (question mark)
#* (asterisk)

};

$root->recurse( callback => $sub, depthfirst => 1 , preorder => 0 );


