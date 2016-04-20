class puppet_tests::fromhiera {
  
  $bizunit=hiera(biz_unit)

notify { "biz unit is ${bizunit} this is from HIERA": }

}
