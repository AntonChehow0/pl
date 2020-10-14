#! /usr/bin/perl

use File::Copy;

my($from, $dist) = @ARGV;

print "From -> $from, to -> $dist\n";

move($from, $dist);