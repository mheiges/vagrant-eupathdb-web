
# install ["screen"]
class ebrc_packages::screen {
  
  $packages = ['screen']

  package { $packages :
    ensure => installed,
  }

}