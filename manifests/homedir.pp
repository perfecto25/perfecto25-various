class various::homedir {

$roothome = homedir('root')
$testhome = homedir('mrx')

notify { "Roots homedir is ${roothome}": }
notify { "mrx home dir is ${testhome}": }





}
