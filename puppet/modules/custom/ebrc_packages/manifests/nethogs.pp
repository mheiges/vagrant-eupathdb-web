
# install ["nethogs"]
class ebrc_packages::nethogs {
  
  $packages = ['nethogs']

  package { $packages :
    ensure => installed,
  }

}