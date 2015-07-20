
# install ["ruby"]
class ebrc_packages::ruby {
  
  $packages = ['ruby']

  package { $packages :
    ensure => installed,
  }

}