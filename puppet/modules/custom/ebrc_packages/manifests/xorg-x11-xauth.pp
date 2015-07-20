
# install ["xorg-x11-xauth"]
class ebrc_packages::xorg-x11-xauth {
  
  $packages = ['xorg-x11-xauth']

  package { $packages :
    ensure => installed,
  }

}