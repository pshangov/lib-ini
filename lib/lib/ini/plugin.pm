package lib::ini::plugin;

# ABSTRACT: Base class for lib::ini plugins

use lib ();

sub import {
    my ($class, %args) = @_;
    my @dirs = $class->generate_inc(%args);
    lib->import(@dirs) if @dirs;
}

1;
