
# install ["R-limma"]
class ebrc_packages::R-limma {
  
  $packages = ['R-limma']

  package { $packages :
    ensure => installed,
  }

}