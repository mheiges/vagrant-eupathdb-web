
# install ["libXt"]
class ebrc_packages::libXt {
  
  $packages = ['libXt']

  package { $packages :
    ensure => installed,
  }

}