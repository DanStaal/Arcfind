# -*- perl -*-

use Test::Script;
use Test::More tests => 2;

script_compiles( 'bin/arcfind', 'Main script compiles' );

script_runs( 'bin/arcfind', 'Main script runs' );