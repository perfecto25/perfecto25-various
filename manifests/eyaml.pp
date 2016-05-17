class various::eyaml {

package { 'rubygems':
  ensure => present,
}

package { 'hiera-eyaml':
  ensure    => present,
  provider  => gem,
}



}
