
# install ["iotop"]
class ebrc_packages::iotop {
  
  $packages = ['iotop']

  package { $packages :
    ensure => installed,
  }

}