package Config::INI::Reader::LibIni;

use strict;
use warnings;

use base 'Config::INI::Reader';

sub new {
    my ($class) = @_;
    return bless { data => [] }, $class;
}

sub change_section {
    my ($self, $section) = @_;
    push @{ $self->{data} }, [ $section => {} ];
}

sub set_value {
    my ($self, $name, $value) = @_;

    if ( exists $self->{data}[-1][1]{$name} ) {
        my $existing = $self->{data}[-1][1]{$name};

        if (ref $existing eq 'ARRAY') {
            push @{ $self->{data}[-1][1]{$name} }, $value;
        } else {
            $self->{data}[-1][1]{$name} = [$existing, $value];
        }
    } else {
        $self->{data}[-1][1]{$name} = $value;
    }
}

sub current_section {
    my ($self) = @_;
    exists $self->{data}[-1] ? $self->{data}[-1][0] : $self->starting_section;
}

1;
