class various::generate {
  
  file { "/tmp/netstat":  
    ensure   => file,
    owner    => 'root',
    group    => 'root',
    content  => generate("/bin/netstat", "|", "grep puppet"),
  }

}

