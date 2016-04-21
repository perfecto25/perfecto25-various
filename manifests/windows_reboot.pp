class various::windows_reboot {

include chocolatey

package { '7zip':
  ensure => absent,
  provider => chocolatey,
}


}
