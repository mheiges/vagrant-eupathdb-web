
# install ["fdupes"]
class ebrc_packages::fdupes {
  
  $packages = ['fdupes']

  package { $packages :
    ensure => installed,
  }

}