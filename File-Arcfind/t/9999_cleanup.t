use Test::More tests => 1;

my @allFiles = <t/testdir/*>;

unlink @allFiles;

ok( rmdir('t/testdir'), 'Deleting testing directory' );