# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'File::Arcfind' ); }

my $object = File::Arcfind->new ();
isa_ok ($object, 'File::Arcfind');


