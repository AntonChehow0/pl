#! /usr/bin/perl

package Device {

    sub new {
        my($class, $type, $name, $forIt, $description, $manufactor) = @_;

        my $self = {
            type => $type,
            name => $name,
            forIt => $forIt,
            description => $description,
            manufactor => $manufactor
        };

        bless $self, $class;

        return $self;
    }

     sub printObject {
        my($self) = @_;

        print "Тип устройства: $self->{type}\n";
        print "Название устройства: $self->{name}\n";
        print "Назначение устройства: $self->{forIt}\n";
        print "Описание: $self->{description}\n";
        print "Производитель: $self->{manufactor}\n";
        
    }

}

1;