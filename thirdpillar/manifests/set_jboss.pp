class thirdpillar::set_jboss(
$jboss_tar_version = "jboss-as-7.1.1.Final.tar.gz"
){
#node 'default' {
    class { 'jboss_as':
        jboss_dist     => $jboss_tar_version,
        jboss_user     => 'jboss-as',
        jboss_group    => 'jboss-as',
        jboss_home     => '/usr/share/jboss-as',
        staging_dir    => '/tmp/puppet-staging/jboss_as',
        standalone_tpl => 'jboss_as/standalone.xml.erb'
    }
#}
}
