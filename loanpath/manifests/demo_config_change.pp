class loanpath::demo_config_change(
        $deploy = true,
) inherits loanpath::params{
        class {'thirdpillar::integration_profile':
                integration_xml_log_directory_path => $integration_xml_log_directory_path,
                integration_servcie_config_locations => $integration_servcie_config_locations,
                integration_xstreamext_config_loader_class => $integration_xstreamext_config_loader_class,
                integration_log_marshaler_task_data => $integration_log_marshaler_task_data,
                integration_log_unmarshaler_task_data => $integration_log_unmarshaler_task_data,
                integration_log_transformer_task_data => $integration_log_transformer_task_data,
                integration_log_transport_task_data => $integration_log_transport_task_data,
                integration_log_validator_task_data => $integration_log_validator_task_data,
                integration_log_custom_task_data => $integration_log_custom_task_data,
                esb_smx_external_url => $esb_smx_external_url,
                esig_register_external_host => $esig_register_external_host,
                esig_citadel_external_host => $esig_citadel_external_host,
                esig_citadel_authentication_user => $esig_citadel_authentication_user,
                esig_citadel_authentication_password => $esig_citadel_authentication_password,
                esb_authuser => $esb_authuser,
                esb_authpassword => $esb_authpassword,
                esig_authuser => $esig_authuser,
                esig_authpassword => $esig_authpassword,
        }
}

