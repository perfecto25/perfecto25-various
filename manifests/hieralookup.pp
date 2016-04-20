class puppet_tests::hieralookup (
  $time_server
)  {
include puppet_tests

notify { "time server is ${time_server}": }


}
