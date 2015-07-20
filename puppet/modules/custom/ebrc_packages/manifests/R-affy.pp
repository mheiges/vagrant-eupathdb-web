
# install ["R-affy"]
class ebrc_packages::R-affy {
  
  $packages = ['R-affy']

  package { $packages :
    ensure => installed,
  }

}