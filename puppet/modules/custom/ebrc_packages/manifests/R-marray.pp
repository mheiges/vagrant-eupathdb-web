
# install ["R-marray"]
class ebrc_packages::R-marray {
  
  $packages = ['R-marray']

  package { $packages :
    ensure => installed,
  }

}