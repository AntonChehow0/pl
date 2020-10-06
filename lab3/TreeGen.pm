use Tree;
use TreeNode;

$tree = new Tree();

print "Введите значения\n";
while (<>) {
    chomp;
    $tree->add($_);
}

print "Вывод\n";

$tree->preorder();

print "Введите значение для удаления\n";

$value = <>;
chomp $value; 
# $tree->remove($value);
$tree->del($value);

print "Вывод\n";

$tree->preorder();