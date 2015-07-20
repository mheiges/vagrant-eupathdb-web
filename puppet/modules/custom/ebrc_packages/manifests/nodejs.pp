
# install ["nodejs"]
class ebrc_packages::nodejs {
  
  $packages = ['nodejs']

  package { $packages :
    ensure => installed,
  }

}