package lib::ini::plugin::dir;

# ABSTRACT: Add directories to @INC

use strict;
use warnings;
use base 'lib::ini::plugin';

sub generate_inc {
    my ($class, %args) = @_;
    my $dir = $args{dir} or return;

    if ( ref $dir) {
        return @$dir;
    } else {
        return $dir;
    }
}

1;
