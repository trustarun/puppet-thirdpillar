class thirdpillar::set_java(
$distribution = "jdk"
){
class { 'java':
  distribution => $distribution,
}
}
