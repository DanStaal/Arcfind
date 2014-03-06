# -*- perl -*-

use Test::More tests => 14;

use File::Arcfind qw(arcfind);

# All the files.
my @resultset = arcfind( 't/testdir', '0', '0', 0);
ok( scalar(@resultset) == 250, 'Count of files in directory: '.scalar(@resultset) );

# Inverted (no files)
my @resultset = arcfind( 't/testdir', '0', '0', 1);
ok( scalar(@resultset) == 0, 'Invert Count: '.scalar(@resultset) );

# Leave the last 100 days.
my @resultset = arcfind( 't/testdir', '0', '100', 0);
ok( scalar(@resultset) == 50, 'Exclude 100 days count: '.scalar(@resultset) );

# The last 100 days.
my @resultset = arcfind( 't/testdir', '0', '100', 1);
ok( scalar(@resultset) == 200, '100 days count: '.scalar(@resultset) );

# Leave the last 100 files.
my @resultset = arcfind( 't/testdir', '100', '0', 0);
ok( scalar(@resultset) == 150, 'Exclude 100 files: '.scalar(@resultset) );

# The last 100 files.
my @resultset = arcfind( 't/testdir', '100', '0', 1);
ok( scalar(@resultset) == 100, '100 files: '.scalar(@resultset) );

# Leave the last 100 files, or 7 days worth.
my @resultset = arcfind( 't/testdir', '100', '7', 0);
ok( scalar(@resultset) == 150, 'Exclude 100 files or 7 days: '.scalar(@resultset) );

# The last 100 files, or 7 days worth.
my @resultset = arcfind( 't/testdir', '100', '7', 1);
ok( scalar(@resultset) == 100, '100 files or 7 days: '.scalar(@resultset) );

# Leave the last 40 files, or 40 days worth.
my @resultset = arcfind( 't/testdir', '40', '40', 0);
ok( scalar(@resultset) == 170, '40 files or 40 days: '.scalar(@resultset) );

# The last 40 files, or 40 days worth.
my @resultset = arcfind( 't/testdir', '40', '40', 1);
ok( scalar(@resultset) == 80, '40 files or 40 days: '.scalar(@resultset) );

# *More than* all the files.
my @resultset = arcfind( 't/testdir', '9999', '0', 0);
ok( scalar(@resultset) == 0, 'Leave more than all the files: '.scalar(@resultset) );

# *More than* all the files.
my @resultset = arcfind( 't/testdir', '9999', '0', 1);
ok( scalar(@resultset) == 250, 'Return more than all the files: '.scalar(@resultset) );

# Leave older than anything we have.
my @resultset = arcfind( 't/testdir', '0', '9999', 0);
ok( scalar(@resultset) == 0, 'Leave more files older than we have: '.scalar(@resultset) );

# *More than* all the files.
my @resultset = arcfind( 't/testdir', '0', '9999', 1);
ok( scalar(@resultset) == 250, 'Return files older than we have: '.scalar(@resultset) );