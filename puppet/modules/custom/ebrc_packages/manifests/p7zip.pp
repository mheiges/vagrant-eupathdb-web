
# install ["p7zip"]
class ebrc_packages::p7zip {
  
  $packages = ['p7zip']

  package { $packages :
    ensure => installed,
  }

}