class various::windows_reboot {

include chocolatey
include reboot

$packages = [ '7zip', 'notepadplusplus', 'cmder' ]


# clear pending reboots on target
reboot { 'before':
    when => pending,
}


package { $packages:
  ensure => installed,
  provider => chocolatey,
}


}
