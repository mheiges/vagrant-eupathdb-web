
# install ["make"]
class ebrc_packages::make {
  
  $packages = ['make']

  package { $packages :
    ensure => installed,
  }

}