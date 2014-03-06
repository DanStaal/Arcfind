#!perl

use Test::More;
eval "use Test::Spelling";
plan skip_all => "Test::Spelling required for testing POD spelling."
    if $@;
plan skip_all => 'Author tests.' unless ( $ENV{RELEASE_TESTING} );
add_stopwords(qw/DStaal DSTAAL Staal todo
				STDERR/);
all_pod_files_spelling_ok();
