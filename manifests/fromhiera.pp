class various::fromhiera {
  
  $bizunit=hiera(biz_unit)

notify { "biz unit is ${bizunit} this is from HIERA": }

}
