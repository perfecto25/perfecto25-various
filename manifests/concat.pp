class puppet_tests::concat {

$file = '/etc/motd'

concat { $file:
  owner => 'root',
  group => 'root',
  mode  => '0644',
}

concat::fragment { 'motd_header':
  target  => $file,
  content => "header stuff here ABC ABC",
  order   => '01',
}

concat::fragment { 'motd_local':
  target => $file,
  source => '/etc/hosts',
  order  => '20',
}



}
