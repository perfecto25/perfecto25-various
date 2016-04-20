class puppet_tests::windows_config {

include acl  
include chocolatey

if $::operatingsystem == 'windows' {

  #Package { provider  => chocolatey, }

  group { 'superheroes':
    ensure  => present,
  }
  
  user { 'superman':
    ensure   => present,
    groups   => 'superheroes',
  }

  file { 'C:\herodir':
    ensure  => directory,
    owner   => 'superman',
    group   => 'superheroes',
  }

  ## ACL Module
  acl { 'c:\herodir':
    permissions => [
      { identity  => 'Users', rights  => ['full'] },
      { identity  => 'superman', rights => ['read','write'] },
      { identity  => 'superheroes', rights  => ['read'] }
      ],
    }


    # REGKEY configs
    # IE Enhanced Security turned on
    registry::value { 'IEsec': 
      key   => 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}',
      value => 'IsInstalled',
      type  => 'dword',
      data  => '1',
    }

    # Shutdown Event Tracker enabled
    registry::value { 'eventTracker':
      key   => 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Reliability',
      value => 'ShutdownReasonUI',
      type  => 'dword',
      data  => '1',
    }

    # DISM
    #  dism { 'IIS-WebServerRole':
    #  ensure  => present,
    #  exitcode => [0, 3010, 194],
    #}

    # dism { 'IIS-WebServer':
    #  ensure  => present,
    #  require => Dism['IIS-WebServerRole'],
    #  exitcode => [0, 3010, 194],
    #}
    
    #package { '7zip':
    #  ensure    => installed,
    #  provider  => 'chocolatey',
    #  source    => 'https://
    #}


}
else {
  fail("Windows Config is for Windows OS only")
}

}
