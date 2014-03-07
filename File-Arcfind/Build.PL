use Module::Build;

# See perldoc Module::Build for details of how this works

Module::Build->new(
                    module_name       => 'File::Arcfind',
                    license           => 'perl',
                    dist_author       => 'Daniel Staal - <DStaal@usa.net>',
                    dist_abstract     => 'Find files to archive.',
                    dist_version_from => 'lib/File/Arcfind.pm',
                    create_readme     => 1,
                    dynamic_config    => 0,
                    script_files      => [qw(bin/arcfind)],
                    requires          => {
                                  Cwd            => 0,
                                  File::Basename => 0,
                                  File::Spec     => 0,
                                  Getopt::Long   => 0,
                                  Pod::Usage     => 0,
                                },
                    test_requires => {
                                       'Test::Script' => 1,
                                       Test::More     => 0,
                                       Test::Deep     => 0,
                                     },
                    configure_requires => { 'Module::Build' => 0.42 },
                  )->create_build_script;