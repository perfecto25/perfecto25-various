class puppet_tests::folders {

file { '/tmp/folder1/folder2':
  ensure  => directory,
  recurse => true,
}


}
