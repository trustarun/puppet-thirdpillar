class loanpath::params{
$scm_branch = 'master'
$scm_path = 'https://github.com/trustarun/lp_war.git'
$war_file = "vms-dauphine-web.war"
$project_name = "dauphine"

#integration profile parameters
$integration_xml_log_directory_path="logs"
$integration_servcie_config_locations="/integration/config/integrationServiceConfig.xml"
$integration_xstreamext_config_loader_class="com.thirdpillar.foundation.webservices.utils.CodifyXstreamExtConfigLoader"
$integration_log_marshaler_task_data="true"
$integration_log_unmarshaler_task_data="true"
$integration_log_transformer_task_data="true"
$integration_log_transport_task_data="true"
$integration_log_validator_task_data="false"
$integration_log_custom_task_data="true"
$esb_smx_external_url="http://10.1.5.1:8192"
$esig_register_external_host="http://10.1.5.60:8080"
$esig_citadel_external_host="http://10.1.5.60:8080"
$esig_citadel_authentication_user="citadel.client"
$esig_citadel_authentication_password="tps123"
$esb_authuser="esbuser"
$esb_authpassword="password"
$esig_authuser="amadmin"
$esig_authpassword="rootroot"
}
