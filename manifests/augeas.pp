class puppet_tests::augeas {

augeas { 'krb': 
  context => '/files/etc/krb5.conf/main',
  changes => 'set default_realm magic',
}





}

