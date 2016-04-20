class puppet_tests::test1 {

  file_line { 'hosts_file':
  ensure => present,
  path   => '/etc/hosts',
  line   => 'abracadabra',
  match  => 'horse',
  }

  #notify { "fact os is ${::facts['operatingsystem']}": }


}
