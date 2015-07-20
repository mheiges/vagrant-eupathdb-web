
# install ["mtr"]
class ebrc_packages::mtr {
  
  $packages = ['mtr']

  package { $packages :
    ensure => installed,
  }

}