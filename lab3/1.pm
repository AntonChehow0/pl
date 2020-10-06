use strict;
use warnings;
# use MyLinkedList;
use LinkedListVersion2;

my $firstItem = LinkedListVersion2->new();
$firstItem->setValues({
    stdBookCode => 0,
    fio         => "asdfasd asdfasd asdf",
    speciality  => "adfasdfa asdf asd fas d fds asd",
    groupCode   => 0,
    year        => 2000} );
my $secondItme = LinkedListVersion2->new();
$secondItme->setValues({
    stdBookCode => 1,
    fio         => "asdfasd56 131651651 asdf",
    speciality  => "adfasdfa asdf asd fas d fds asd",
    groupCode   => 1,
    year        => 2000});

my $fothItme = LinkedListVersion2->new();
$fothItme->setValues({
    stdBookCode => 4,
    fio         => "asdfads 131651651 asdf",
    speciality  => "sadvsd asdf asd fas d fds asd",
    groupCode   => 4,
    year        => 2000});

my $thirdItme = LinkedListVersion2->new();
$thirdItme->setValues({
    stdBookCode => 3,
    fio         => "asdfads 131651651 asdf",
    speciality  => "sadvsd asdf asd fas d fds asd",
    groupCode   => 3,
    year        => 2000});

$firstItem->insert($secondItme);
$firstItem->insert($fothItme);
$firstItem->insert($thirdItme);

$firstItem->print();
$firstItem->remove($thirdItme);
print "\n\n";
$firstItem->print();