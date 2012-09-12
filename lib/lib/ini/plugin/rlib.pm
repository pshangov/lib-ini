package lib::ini::plugin::rlib;

# ABSTRACT: Add './lib' to @INC

use strict;
use warnings;
use File::Spec;
use base 'lib::ini::plugin';

sub generate_inc { File::Spec->catdir( File::Spec->curdir, 'lib' ) }

1;
