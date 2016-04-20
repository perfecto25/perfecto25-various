class various::duplicate {

file { 'demo':
  ensure => file,
  path   => '/tmp',
}


package { 'demo':
  name => 'httpd',
  
}



}
