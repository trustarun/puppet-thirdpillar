class loanpath(

	$jboss_home = hiera('loanpath::jboss_home'),
	$puppet_module_path = hiera('loanpath::puppet_module_path'),
	$project_name = hiera('loanpath::project_name'),
	$static_files_path  = hiera('loanpath::static_files_path'),
	$war_file_path = hiera('loanpath::war_files_path'),
	$war_file_name = hiera('loanpath::warfile_name'),
        $deployment_timeout = hiera('loanpath::deployment_timeout'),

	#Database properties
        $datasource_jndi_name = hiera('loanpath::datasource_jndi_name'),
	$datasource_pool_name = hiera('loanpath::datasource_pool_name'),
	$xa_datasource_class = hiera('loanpath::xa_datasource_class'),
	$database_driver = hiera('loanpath::database_driver'),
	$database_module = hiera('loanpath::database_module'),

	$database_vendor = hiera('loanpath::database_vendor'),
	$database_password = hiera('loanpath::database_password'),
	$database_url = hiera('loanpath::database_url'),
	$database_username = hiera('loanpath::database_username'),
	$database_driverClassName = hiera('loanpath::database_driverClassName'),
	$database_schema = hiera('loanpath::database_schema'),
	$database_hibernate_dialect = hiera('loanpath::database_hibernate_dialect'),
	$database_connection_datasource = hiera('loanpath::database_connection_datasource'),
	$database_host = hiera('loanpath::database_host'),
	$database_port = hiera('loanpath::database_port'),
	$database_name = hiera('loanpath::database_name'),
	# Hibernate JTA transaction lookup class, need to change if using container JTA
	#hibernate.transaction.manager_lookup_class: org.hibernate.transaction.BTMTransactionManagerLookup
	$hibernate_transaction_manager_lookup_class = hiera('loanpath::hibernate_transaction_manager_lookup_class'),
	#Hibarenate Search Properties
	$hibernate_search_default_indexBase = hiera('loanpath::hibernate_search_default_indexBase'),

	#app web properties
	$email_host = hiera('loanpath::email_host'),
	$email_port = hiera('loanpath::email_port'),
	$email_userName = hiera('loanpath::email_userName'),
	$email_password = hiera('loanpath::email_password'),
	$email_use_external_client = hiera('loanpath::email_use_external_client'),
	$email_default_from_address = hiera('loanpath::email_default_from_address'),
	$webapp_server_scheme = hiera('loanpath::webapp_server_scheme'),
	$webapp_server_name = hiera('loanpath::webapp_server_name'),
	$webapp_server_port = hiera('loanpath::webapp_server_port'),
	$webapp_server_contextpath = hiera('loanpath::webapp_server_contextpath'),
	$webapp_server_url = hiera('loanpath::webapp_server_url'),
	$webapp_server_baseurl = hiera('loanpath::webapp_server_baseurl'),
        $security_webapp =  hiera('loanpath::security_webapp'),
	$security_authentication_expire_password_days = hiera('loanpath::security_authentication_expire_password_days'),
	$security_authentication_max_failed_login_attempts = hiera('loanpath::security_authentication_max_failed_login_attempts'),
        $security_webapp_siteminder_logoffurl = hiera('loanpath::security_webapp_siteminder_logoffurl'),
	$application_disbursement_external_url = hiera('loanpath::application_disbursement_external_url'),
	$webapp_server_portalurl = hiera('loanpath::webapp_server_portalurl'),
	$noia_trigger_scheduler_expression = hiera('loanpath::noia_trigger_scheduler_expression'),
	$ucc_search_order_status_scheduler_expression = hiera('loanpath::ucc_search_order_status_scheduler_expression'),
	$print_docs_scheduler_expression = hiera('loanpath::print_docs_scheduler_expression'),
	$hibernate_ehcache_file = hiera('loanpath::hibernate_ehcache_file'),
	$document_pdf_encryption_ownerPassword = hiera('loanpath::document_pdf_encryption_ownerPassword'),
	$document_pdf_watermark_text = hiera('loanpath::document_pdf_watermark_text'),
	$implementation_practice_enabled = hiera('loanpath::implementation_practice_enabled'),
	$default_homeUrl = hiera('loanpath::default_homeUrl'),
        $date_format_pattern = hiera('loanpath::date_format_pattern'),
        $datetime_format_pattern = hiera('loanpath::datetime_format_pattern'),

	#integration properties
	$integration_xml_log_directory_path = hiera('loanpath::integration_xml_log_directory_path'),
	$integration_servcie_config_locations = hiera('loanpath::integration_servcie_config_locations'),
	$integration_xstreamext_config_loader_class = hiera('loanpath::integration_xstreamext_config_loader_class'),
	$integration_log_marshaler_task_data = hiera('loanpath::integration_log_marshaler_task_data'),
	$integration_log_unmarshaler_task_data = hiera('loanpath::integration_log_unmarshaler_task_data'),
	$integration_log_transformer_task_data = hiera('loanpath::integration_log_transformer_task_data'),
	$integration_log_transport_task_data = hiera('loanpath::integration_log_transport_task_data'),
	$integration_log_validator_task_data= hiera('loanpath::integration_log_validator_task_data'),
	$integration_log_custom_task_data = hiera('loanpath::integration_log_custom_task_data'),
	$esb_smx_external_url = hiera('loanpath::esb_smx_external_url'),
	$esig_register_external_host = hiera('loanpath::esig_register_external_host'),
	$esig_citadel_external_host = hiera('loanpath::esig_citadel_external_host'),
	$esig_citadel_authentication_user = hiera('loanpath::esig_citadel_authentication_user'),
	$esig_citadel_authentication_password = hiera('loanpath::esig_citadel_authentication_password'),
	$esb_authuser = hiera('loanpath::esb_authuser'),
	$esb_authpassword = hiera('loanpath::esb_authpassword'),
	$esig_authuser = hiera('loanpath::esig_authuser'),
	$esig_authpassword = hiera('loanpath::esig_authpassword'),

){

	Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }


	#install postgresql database
	class { 'postgresql::server':
	  ip_mask_deny_postgres_user => hiera('loanpath::postgresql_denied_users'),
	  ip_mask_allow_all_users    => hiera('loanpath::postgresql_allowed_users'),
	  listen_addresses           => hiera('loanpath::postgresql_listen_addresses'),
	  postgres_password          => hiera('loanpath::postgresql_password'),
	}

	class { 'java':
	  distribution => hiera('loanpath::java_distribution'),
	}

	class { 'jboss_as':
		jboss_dist     => hiera('loanpath::jboss_installation_file'),
		jboss_user     => hiera('loanpath::jboss_user'),
		jboss_group    => hiera('loanpath::jboss_group'),
		jboss_home     => hiera('loanpath::jboss_home'),
		staging_dir    => hiera('loanpath::jboss_staging_directory'),
		standalone_tpl => hiera('loanpath::jboss_standalone_template')
	}

	Class['java'] ->  Class['jboss_as']

	exec { "remove_old_jboss_modules":
	  command => "rm -rf *",
	  cwd => "${jboss_home}/modules",
	 }

	exec { "add_jboss_modules":
	  command => "cp -rf * ${jboss_home}/modules",
	  cwd => "${static_files_path}/jboss_modules",
	  subscribe => Exec["remove_old_jboss_modules"],
	 }

	#fectching current war code will come here.It is manual for now

	exec { "clean_temp_war_folder":
	  command => "rm -rf *",
	  cwd => "${static_files_path}/temp_war",
	  subscribe => Exec["add_jboss_modules"],
	 }


	exec { "extract_war_for_modification":
	  command => "jar -xvf ${static_files_path}/current_war/${war_file_name}",
	  cwd => "${static_files_path}/temp_war",
	  subscribe => Exec["clean_temp_war_folder"],
	 }

        file { 'database.properties':
                path    => "${static_files_path}/temp_war/WEB-INF/classes/database.properties",
                ensure  => file,
                content => template("loanpath/database_properties.erb"),
                subscribe => Exec["extract_war_for_modification"],
          }

	file { 'integration.properties':
	        path    => "${static_files_path}/temp_war/WEB-INF/classes/integration/config/integration.properties",
	        ensure  => file,
	        content => template("loanpath/integration_properties.erb"),
	        subscribe => File['database.properties'],
	  }

	file { 'codify-app-web.properties':
	        path    => "${static_files_path}/temp_war/WEB-INF/classes/codify-app-web.properties",
	        ensure  => file,
	        content => template("loanpath/app_web_properties.erb"),
	        subscribe => File["integration.properties"],
	  }

	exec { "create_war_with_updated_configuration":
	  command => "jar -cvf ${war_file_name} .",
	  cwd => "${static_files_path}/temp_war",
	  subscribe => File["codify-app-web.properties"],
	 }

	exec { "remove_old_war_from_jboss_files_folder":
	  command => "rm  ${war_file_name}",
	  cwd => "${puppet_module_path}/jboss_as/files",
	  onlyif => ["test -f ${war_file_name}"],
	  subscribe => Exec["create_war_with_updated_configuration"],
	}

	exec { "copy_war_to_jboss_files_folder":
	  command => "cp ${war_file_name} ${$puppet_module_path}/jboss_as/files",
	  cwd => "${static_files_path}/temp_war",
	  subscribe   => Exec["remove_old_war_from_jboss_files_folder"],
	}

        exec { "undeploy_current_application":
          command => "rm -rf *",
          cwd => "${jboss_home}/standalone/deployments",
          subscribe   => Exec["copy_war_to_jboss_files_folder"],
        }


        file { 'standalone.xml.erb':
                path    => "${puppet_module_path}/jboss_as/templates/standalone.xml.erb",
                ensure  => file,
                content => template("loanpath/jboss_standalone_xml.erb"),
                subscribe => Exec["undeploy_current_application"],
         }

        jboss_as::deploy { "${project_name}":
           pkg         => $war_file_name,
           is_deployed => true,
           hot_deploy  => false,
         }

       
       File['standalone.xml.erb'] -> Jboss_as::Deploy["${project_name}"]
}
