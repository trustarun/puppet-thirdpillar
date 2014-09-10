class loanpath(
$deploy = true,
) inherits loanpath::params{
class {'thirdpillar::set_java':
  distribution => "jdk",
}

-> 

class {'thirdpillar::set_jboss':
jboss_tar_version => "jboss-as-7.1.1.Final.tar.gz",
}

-> 

class {'thirdpillar::get_source_code':
 revision => $scm_branch,
 repository_path => $scm_path,
}

-> 

class {'thirdpillar::deploy_jboss':
 war_file_name => $war_file,
 deployment_target => $project_name,
}
}
