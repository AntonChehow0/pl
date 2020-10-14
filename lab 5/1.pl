#! /usr/bin/perl

open STDOUT, ">", "program.log" or die "Can`t open file";

sub hanoi {
    my($n, $from, $to, $add) = @_;
    if ($n == 0) {
        return;
    }

    hanoi($n-1, $from, $add, $to);
    print "$from -> $to\n";
    hanoi($n-1, $add, $to, $from);
}

print "Введите количество дисков\n";
$count = <>;
chomp $count;

hanoi($count, 1, 2, 3);