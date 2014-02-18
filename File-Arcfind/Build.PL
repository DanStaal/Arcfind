use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'File::Arcfind',
      license         => 'perl',
      dist_author     => 'Daniel Staal - <DStaal@usa.net>',
      dist_abstract   => 'Find files to archive.',
      create_readme   => 1,
      dynamic_config  => 0,
      create_makefile_pl => 'passthrough',
    )->create_build_script;
