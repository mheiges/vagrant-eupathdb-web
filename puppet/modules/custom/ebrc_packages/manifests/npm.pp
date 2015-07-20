
# install ["npm"]
class ebrc_packages::npm {
  
  $packages = ['npm']

  package { $packages :
    ensure => installed,
  }

}