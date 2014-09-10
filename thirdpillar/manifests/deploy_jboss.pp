class thirdpillar::deploy_jboss(
$war_file_name = "vms-dauphine-web.war",
$deployment_target = "dauphine"
) inherits thirdpillar::params {

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

        exec { "remove_old_war_from_jboss":
          command => "rm $war_file_name",
          cwd => "${$puppet_module_path}/jboss_as/files",
          onlyif => ["test -f ${$puppet_module_path}/jboss_as/files/{war_file_name}"],
        }
 ->

        exec { "copy_war_to_jboss_module_files_folder":
          command => "cp ${war_file_name} ${$puppet_module_path}/jboss_as/files",
          cwd => $project_path,
        }

->

    jboss_as::deploy { "${deployment_target}":
        pkg         => $war_file_name,
        is_deployed => true,
        hot_deploy  => false,
         }

}
