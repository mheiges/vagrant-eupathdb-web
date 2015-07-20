
# install ["R-RSQLite"]
class ebrc_packages::R-RSQLite {
  
  $packages = ['R-RSQLite']

  package { $packages :
    ensure => installed,
  }

}