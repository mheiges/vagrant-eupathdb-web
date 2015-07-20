
# install ["R-makecdfenv"]
class ebrc_packages::R-makecdfenv {
  
  $packages = ['R-makecdfenv']

  package { $packages :
    ensure => installed,
  }

}