
# install ["R-gcrma"]
class ebrc_packages::R-gcrma {
  
  $packages = ['R-gcrma']

  package { $packages :
    ensure => installed,
  }

}