class puppet_tests::tidy {

tidy { 'myfile':
  path    => '/tmp',
  matches => "*myfile*",
  recurse => true,
  




}




}
