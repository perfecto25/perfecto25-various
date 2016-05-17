## PERFECTO25 PuppetMaster setup

class various::puppetmaster {

  package { 'puppet-lint':
    ensure   => present,
    provider => gem,
  }

  package { 'hiera-eyaml':
    ensure   => present,
    provider => gem,
  }


#SSH key for r10k/Code Manager to connect to GitHub
$r10k_ssh_key_file = '/etc/puppetlabs/puppetserver/ssh/id-control_repo.rsa'

  file { '/etc/puppetlabs/puppetserver/ssh':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  exec { 'create r10k ssh key' :
    command => "/usr/bin/ssh-keygen -t rsa -b 4096 -C 'r10k' -f ${r10k_ssh_key_file} -q -N ''",
    creates => $r10k_ssh_key_file,
    require => File['/etc/puppetlabs/puppetserver/ssh'],
  }

  file { $r10k_ssh_key_file:
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'root',
    mode    => '0600',
    require => Exec['create r10k ssh key'],
  }

  file { "${r10k_ssh_key_file}.pub":
    ensure  => file,
    owner   => 'pe-puppet',
    group   => 'root',
    mode    => '0644',
    require => Exec['create r10k ssh key'],
  }
  
}