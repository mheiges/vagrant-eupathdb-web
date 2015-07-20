
# install ["wireshark"]
class ebrc_packages::wireshark {
  
  $packages = ['wireshark']

  package { $packages :
    ensure => installed,
  }

}