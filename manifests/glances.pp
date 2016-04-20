class puppet_tests::glances {


package { 'glances':
  ensure  => latest,
  require => File['/tmp/glances.conf'],
  

}


file { '/tmp/glances.conf':
  # path  => '/tmp',
  ensure  => present,
  owner   => 'root',
  mode    => '0664',
  content => " this is my fake glances conf file",
  before  => Package['glances'],
}






}
