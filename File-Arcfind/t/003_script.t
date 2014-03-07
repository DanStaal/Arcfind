# -*- perl -*-

use Test::Script;
use Test::More tests => 7;

script_compiles( 'bin/arcfind', 'Main script compiles' );

script_runs( 'bin/arcfind', 'Main script runs' );

my @resultset = `bin/arcfind t/testdir`;

ok( scalar(@resultset) == 150, 'Base Options: ' . scalar(@resultset) );

@resultset = `bin/arcfind -i t/testdir`;

ok( scalar(@resultset) == 100, 'Inverted Options: ' . scalar(@resultset) );

my @resultset = `bin/arcfind -d t/testdir`;

ok( scalar(@resultset) == 150, 'Directory test: ' . scalar(@resultset) );

my @resultset = `bin/arcfind -a 51 t/testdir`;

ok( scalar(@resultset) == 148, 'Age Test: ' . scalar(@resultset) );

my @resultset = `bin/arcfind -f 50 t/testdir`;

ok( scalar(@resultset) == 200, 'Number of Files Test: ' . scalar(@resultset) );