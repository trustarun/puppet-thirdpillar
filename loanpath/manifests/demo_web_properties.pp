class loanpath::demo_web_properties(
	$deploy = true,
) inherits loanpath::params{
	class {'thirdpillar::web_properties':
			email_host => $email_host,
			email_port => $email_port,
			email_userName => $email_userName,
			email_password => $email_password,
			email_use_external_client => $email_use_external_client,
			email_default_from_address => $email_default_from_address,
			webapp_server_scheme => $webapp_server_scheme,
			webapp_server_name => $webapp_server_name, 
			webapp_server_port => $webapp_server_port, 
			webapp_server_contextpath => $webapp_server_contextpath,
			webapp_server_url => $webapp_server_url,
			webapp_server_baseurl => $webapp_server_baseurl,
			security_authentication_expirePasswordInDays => $security_authentication_expirePasswordInDays,
			security_authentication_maxFailedLoginAttempts => $security_authentication_maxFailedLoginAttempts,
			application_disbursement_external_url => $application_disbursement_external_url,
			webapp_server_portalurl => $webapp_server_portalurl,
			noia_trigger_scheduler_expression => $noia_trigger_scheduler_expression,
			ucc_search_order_status_scheduler_expression => $ucc_search_order_status_scheduler_expression,
			print_docs_scheduler_expression => $print_docs_scheduler_expression,
			hibernate_ehcache_file => $hibernate_ehcache_file,
			document_pdf_encryption_ownerPassword =>  $document_pdf_encryption_ownerPassword,
			document_pdf_watermark_text => $document_pdf_watermark_text,
			implementation_practice_enabled => $implementation_practice_enabled,
			default_homeUrl => $default_homeUrl,
	}
}
