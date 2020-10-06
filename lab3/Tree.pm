package Tree {
    use strict;
    use warnings;
    use TreeNode;

    sub new {
        my($class) = @_;
        my $self = {
            head => undef, 
            elementCount => 0
        };
        bless $self, $class;
        return $self;
    }

    sub addTo {
        my($self, $node, $value) = @_;

        my $comp = $value <=> $node->{value};
        if ($comp < 0) {
            if (!$node->{leftChild}) {
                $node->{leftChild} = new TreeNode($value);
            } else {
                $self->addTo($node->{leftChild}, $value);
            }
        } else {
            if (!$node->{rightChild}) {
                $node->{rightChild} = new TreeNode($value);
            } else {
                $self->addTo($node->{rightChild}, $value);
            }
        }

    }

    sub add {
        my($self, $value) = @_;
        if (!$self->{head}) {
            $self->{head} = new TreeNode($value)
        } else {
            $self->addTo($self->{head}, $value);
        }

        $self->{elementCount}++;
    }

    sub findWithParent {
        my($self, $value, $parent) = @_;
        my $current = $self->{head};
        $$parent = undef;

        while ($current) {
            my $r = $current->{value} <=> $value;
            if ($r > 0) {
                $$parent = $current;
                $current = $current->{leftChild};                
            }  elsif ($r < 0) {
                $$parent = $current;
                $current = $current->{rightChild};
            } else {
                last;
            }
        }
                

    }

    sub remove {
        my($self, $value) = @_;
        my $parent = undef;
        my $current = $self->findWithParent($value, \$parent);

        if (!$parent) {
            return 0;
        }

        $self->{elementCount}--;

        if (!$current->{rightChild}) {
            if (!$parent) {
                $self->{head} = $current->{leftChild};
            } else {
                my $r = $parent->compare($current);
                if ($r > 0) {
                    $parent->{leftChild} = $current->{leftChild};
                } else  {
                    if ($r < 0) {
                        $parent->{leftChild} = $current->{rightChild};
                    }
                }
                
            }
        }
    }

    sub findWithParent {
        my($self, $value, $parentLink) = @_;

        my $current = $self->{head};
        $$parentLink = undef;

        while ($current) {
            my $r = $current->{value} <=> $value;
            if ($r > 0) {
                $$parentLink = $current;
                $current = $current->{leftChild};
            } else {
                if ($r < 0) {
                    $$parentLink = $current;
                    $current = $current->{rightChild};
                } else {
                    last;
                }
            }
        }
        return $current;
    }


    sub preorder {
        my($self) = @_;
        $self->pr($self->{head});
    }

    sub pr {
        my($self, $node) = @_;
        if ($node) {
            print "V -> $node->{value}\n";
            $self->pr($node->{leftChild});
            $self->pr($node->{rightChild});
        }   
    }


    sub del {
        my($self, $value) = @_;
        # $self->{head} = $self->rDel($self->{head}, $value);
        $self->rDel($self->{head}, $value);
    }

    sub rDel {
        my($self, $node, $value) = @_;
        if (!$node) {
            return undef;
        }

        if ($value == $node->{value}) {
            if (!$node->{leftChild} && !$node->{rightChild}) {
                return undef;
            }

            if (!$node->{rightChild}) {
                return $node->{leftChild};
            }

            if (!$node->{leftChild}) {
                return $node->{rightChild};
            }
            my $smv = $self->findSmallestValue($node->{rightChild});
            $node->{value} = $smv;
            $node->{rightChild} = $self->rDel($node->{rightChild}, $smv);
            return $node;
        }
        if ($value < $node->{value}) {
            $node->{leftChild} = $self->rDel($node->{leftChild}, $value);
            return $node;
        }

        $node->{rightChild} = $self->rDel($node->{rightChild}, $value);
        return $node;
    }



}

1;