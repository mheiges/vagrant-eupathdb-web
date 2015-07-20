
# install ["minicom"]
class ebrc_packages::minicom {
  
  $packages = ['minicom']

  package { $packages :
    ensure => installed,
  }

}