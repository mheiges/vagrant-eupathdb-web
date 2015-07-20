
# install ["dos2unix"]
class ebrc_packages::dos2unix {
  
  $packages = ['dos2unix']

  package { $packages :
    ensure => installed,
  }

}