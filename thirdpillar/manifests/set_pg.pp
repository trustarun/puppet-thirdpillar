class thirdpillar::set_pg(
$blocked_user_port = '0.0.0.0/32',
$all_allowed_user_port = '0.0.0.0/0',
$pg_password = 'happyarun',
$fireball = true,
){
class { 'postgresql::server':
  ip_mask_deny_postgres_user => $blocked_user_port,
  ip_mask_allow_all_users    => $all_allowed_user_port,
  listen_addresses           => '*',
  postgres_password          => $pg_password,
}

}
