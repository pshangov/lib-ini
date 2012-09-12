package lib::ini::plugin::libdir;

# ABSTRACT: Add directories to @INC, appending 'lib'

use strict;
use warnings;
use File::Spec;
use base 'lib::ini::plugin';

sub generate_inc {
    my ($class, %args) = @_;
    my $dir = $args{dir} or return;
    return map File::Spec->catdir( $_, 'lib' ),
           ref $dir ? @{ $args{dir} } : $dir;
}

1;
