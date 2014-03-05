#!/usr/bin/perl

package arcfind;

=head1 NAME

arcfind - The archival file finder.

=cut

use strict;

require Exporter;
our @ISA = ("Exporter");
our @EXPORT = qw(&arcfind);

my $VERSION = "1.20";

# arcfind
#
# The main subroutine.  Opens the dir, reads the files, sorts them,
# then selects the which ones we actually want.
#
# Parameters:
# $dir:  The directory we want the files from.
# $minFiles:  The minimum number of files to leave.
# $maxAge:  The maximum age of the files to leave.
# $inverse:  (Boolean) Set if you want inverse output.
sub arcfind {
	# Set up our local variables
	my ($directory, $minFiles, $maxAge, $inverse) = @_;

	# Get the files in the directory.
	my @allFiles = <$directory/*>;

	# Put the file ages into a hash, so we can use them.
	my %fileAges;
	foreach (@allFiles)
	{
		$fileAges{$_} = -M $_;
	}

	# Set up the return array.
	my @returnFiles;

	if ( @allFiles > $minFiles )
	{
		@allFiles = sort { $fileAges{$b} <=> $fileAges{$a} } @allFiles;

		for ( my $i = 0; $i < @allFiles; $i++ )
		{
			if 	(  ($fileAges{$allFiles[$i]} >= $maxAge) and
					($i < (@allFiles - $minFiles))
					)
			{
				push @returnFiles, $allFiles[$i];
			}
			else {
				last;
			}
		}
	} else
	{
		# If there are less files than we want left, return none.
		@returnFiles = ();
	}

	# If they happen to want the inverse listing, give it.
	if ( $inverse )
	{
		if (@returnFiles)
		{
			@returnFiles = @allFiles[scalar(@returnFiles) .. (scalar(@allFiles) -1 )];
		} else
		{
			# We could probably skip this sort, and only sort if they ask for it,
			# but I'd either have to do one of the following:
			# 1. Break encapsulation
			# 2. Sort the returned list twice for *most* cases.
			# 3. Pass another parameter, just to check here.
			# Number 3 is possible, but at the moment I'll leave as is.
			@returnFiles = sort { $fileAges{$b} <=> $fileAges{$a} } @allFiles;
		}
	}

	return @returnFiles;
}

