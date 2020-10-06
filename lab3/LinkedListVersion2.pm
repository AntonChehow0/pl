package LinkedListVersion2 {
    use strict;
    use warnings;

    sub new {
        my($class) = @_;
        my $self = {
            stdBookCode => shift,
            fio         => shift,
            speciality  => shift,
            groupCode   => shift,
            year        => shift,
            _next       => shift,
        };
        bless $self, $class;
        return $self;
    }

    sub setValues {
        my($self, $obj) = @_;
        $self->{stdBookCode}    = $obj->{stdBookCode};
        $self->{fio}            = $obj->{fio};
        $self->{groupCode}      = $obj->{groupCode};
        $self->{speciality}     = $obj->{speciality};
        $self->{year}           = $obj->{year};

    }

    sub add {
        my ($self, $_next) = @_;
        $self->{_next} = \$_next;
        return $self;
    }

    sub insert {
        my ($self, $_next, $prev) = @_;
        if (($_next->{stdBookCode} > $self->{stdBookCode})) {
            if ($self->{_next}) {
                my $unwNext = ${$self->{_next}};
                $unwNext->insert($_next, $self);
            } else {
                $self->{_next} = \$_next;
            }
        } else {
            if ($_next->{stdBookCode} == $self->{stdBookCode}) {
                return;
            }
            $prev->{_next} = \$_next;
            my $currentItemLink = \$self;
            ${$prev->{_next}}->{_next} = $currentItemLink;
        }
    }

    sub remove {
        my($self, $obj, $prev) = @_;
        if ($obj->{stdBookCode} == $self->{stdBookCode}) {
            if ($self->{stdBookCode} == $obj->{stdBookCode}) {
                if ($self->{_next}) {
                    $prev->{_next} = $self->{_next};
                } else {
                    $prev->{_next} = undef;
                }
            }
        } else {
            if ($self->{_next}) {
                my $nextObj = ${$self->{_next}};
                $nextObj->remove($obj, $self);
            }
        }
    }

    sub print {
        my ($self) = @_;
        print "==========================================\n";
        print "student`s book number --> ";
        print $self->{stdBookCode};
        print "\n";
        print "student`s FIO --> ";
        print $self->{fio};
        print "\n";
        print "student`s group code --> ";
        print $self->{groupCode};
        print "\n";
        print "student`s speciality --> ";
        print $self->{speciality};
        print "\n";
        print "student`s year --> ";
        print $self->{year};
        print "\n";
        print "==========================================\n\n";

        if ($self->{_next}) {
            my $unwrappedValue = ${$self->{_next}};
            $unwrappedValue->print();
        } 
    }
}

1; 