#! /usr/bin/perl

use strict;
use warnings;
use Path::Class;

my($dir) = @ARGV;
$dir = "." unless $dir;
&loopDir($dir, "");
exit;

sub loopDir {
   my($dir, $margin) = @_;
   chdir($dir) || die "Cannot chdir to $dir\n";
   local(*DIR);
   opendir(DIR, ".");
   my $f;
   while ($f = readdir(DIR)) {
      next if ($f eq "." || $f eq "..");
      my @stat = stat($f);
      print "$margin$f $stat[7] $stat[10] $stat[2]\n";  //https://www.computerworld.com/article/2822001/unix-tip--displaying-file-attributes-with-the-perl-stat-command.html
      if (-d $f) {
        &loopDir($f,$margin."   ");
      }
   }
   closedir(DIR);
   chdir("..");
}