
# install ["gcc"]
class ebrc_packages::gcc {
  
  $packages = ['gcc']

  package { $packages :
    ensure => installed,
  }

}