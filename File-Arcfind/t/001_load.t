# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok('File::Arcfind'); }

mkdir 't/testdir';

if ( -d 't/testdir' ) {
	pass('Testing directory created.');
}
else {
	fail('Testing directory cannot be created.');
	BAIL_OUT(
		'Need to create files in the filesystem to continue testing.  Aborting.'
	);
} ## end else [ if ( -d 't/testdir' ) ]

my $timeset = time;

for ( my $i = 0 ; $i < 250 ; $i++ ) {
	my $fh;
	open( $fh, '>', "t/testdir/test$i" );
	utime $timeset, $timeset, "t/testdir/test$i";
	$timeset = $timeset - 86400;
} ## end for ( my $i = 0 ; $i < ...)