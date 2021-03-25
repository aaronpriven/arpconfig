#!/usr/bin/env perl

use 5.024;
use warnings;

$| = 1;

use Path::Class;

my $rootname = shift @ARGV // '.';

my $root = dir($rootname);

my $prevparent = '';

my $sub = sub {

    my $file = shift;

    my $parent = $file->parent;
    if  ("$parent" ne $prevparent) {
       say $parent;
       $prevparent = "$parent";
    }

    if ($file->is_dir) {
        return;
    }
    return if $file =~ /\.as$/;
    my $is_alias = `/usr/bin/GetFileInfo  -aa "$file"`;
    chomp $is_alias;

    if ($is_alias) {
       $file->remove;
       return;
    }

    return unless -s "$file/..namedfork/rsrc";

    my $result = system ('/usr/bin/applesingle', 'encode' , "$file");
    my $exitcode = $result >> 8;

    die "$file: applesingle exited with status $exitcode" 
        if $exitcode;

    $file->remove;

};

$root->recurse( callback => $sub );


