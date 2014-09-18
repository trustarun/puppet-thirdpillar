class thirdpillar::set_maven{

class { 'maven::maven': } 
->

maven { '/tmp/maven-core-3.0.5.jar':
  id     => 'org.apache.maven:maven-core:3.0.5:jar',
  repos  => ['central::default::http://repo1.maven.apache.org/maven2','http://mirrors.ibiblio.org/pub/mirrors/maven2'],
} 

->
maven { '/tmp/maven-core-3.0.5-sources.jar':
  groupid    => 'org.apache.maven',
  artifactid => 'maven-core',
  version    => '3.0.5',
  classifier => 'sources',
}

}

