
# install ["R-core"]
class ebrc_packages::R-core {
  
  $packages = ['R-core']

  package { $packages :
    ensure => installed,
  }

}