class puppet_tests::duplicate {

file { 'demo':
  ensure => file,
  path   => '/tmp',
}


package { 'demo':
  name => 'httpd',
  
}



}
