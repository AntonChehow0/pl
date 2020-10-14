#! /usr/bin/perl

use Path::Class;

my @files;

my($dir, $fileExtension) = @ARGV;
chdir($dir);
dir('.')->recurse(callback => sub {
    my $file = shift;
    if($file =~ ".$fileExtension") {
        push @files, $file->absolute->stringify;
    }
});

for my $file (@files) {
    print "$file\n";
    unlink($file);
}