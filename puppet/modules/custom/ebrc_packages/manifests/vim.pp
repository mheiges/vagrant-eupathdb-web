
# install ["vim"]
class ebrc_packages::vim {
  
  $packages = ['vim']

  package { $packages :
    ensure => installed,
  }

}