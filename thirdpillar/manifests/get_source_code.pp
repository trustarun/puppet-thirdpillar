class thirdpillar::get_source_code( 
    $revision = 'master',
    $repository_path = 'https://github.com/trustarun/lp_war.git',
    ) inherits thirdpillar::params {

    vcsrepo {"${project_path}":
      ensure   => present,
      provider => git,
      source   => $repository_path,
      revision => $revision,
    }
  }

