class puppet_tests::generate {
  
  file { "/tmp/netstat":  
    ensure   => file,
    owner    => 'root',
    group    => 'root',
    content  => generate("/bin/netstat", "|", "grep puppet"),
  }

}

