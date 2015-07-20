
# install ["wireshark-gnome"]
class ebrc_packages::wireshark-gnome {
  
  $packages = ['wireshark-gnome']

  package { $packages :
    ensure => installed,
  }

}