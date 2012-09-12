package lib::ini;

# ABSTRACT: Plugin-based @INC mangling

use strict;
use warnings;

use Class::Load;
use Config::INI::Reader::LibIni;
use String::RewritePrefix;

sub import {
    my $config_filename = 'lib.ini';
    my $plugin_prefix   = 'lib::ini::plugin::';

    return unless -e $config_filename && -f $config_filename;

    my $ini = Config::INI::Reader::LibIni->read_file($config_filename);

    foreach my $section (@$ini) {
        my ($name, $data) = @$section;

        if ($name eq '_') {
            next; # ignore root-level options for now
        } else {
            my $package = String::RewritePrefix->rewrite(
                { '' => $plugin_prefix, '+' => '' }, $name,
            );
            Class::Load::load_class($package);
            $package->import(%$data);
        }
    }
}

1;
