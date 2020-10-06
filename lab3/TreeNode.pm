package TreeNode {
    use strict;
    use warnings;

    sub new {
        my($class, $value) = @_;
        my $self = {
            value        => $value,
            leftChild    => undef,
            rightChild   => undef
        };
        bless $self, $class;
        return $self;
    }

    sub compare {
        my($self, $node) = @_;
        return $self->{value} <=> $node->{value};
    }

}

1;