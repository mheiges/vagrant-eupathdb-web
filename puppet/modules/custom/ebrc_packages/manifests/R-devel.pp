
# install ["R-devel"]
class ebrc_packages::R-devel {
  
  $packages = ['R-devel']

  package { $packages :
    ensure => installed,
  }

}