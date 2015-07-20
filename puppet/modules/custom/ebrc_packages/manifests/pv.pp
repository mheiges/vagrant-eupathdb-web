
# install ["pv"]
class ebrc_packages::pv {
  
  $packages = ['pv']

  package { $packages :
    ensure => installed,
  }

}