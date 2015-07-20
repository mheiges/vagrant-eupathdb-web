
# install ["lua-socket"]
class ebrc_packages::lua-socket {
  
  $packages = ['lua-socket']

  package { $packages :
    ensure => installed,
  }

}