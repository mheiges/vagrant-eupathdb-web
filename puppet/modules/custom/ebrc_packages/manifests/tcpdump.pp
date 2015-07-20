
# install ["tcpdump"]
class ebrc_packages::tcpdump {
  
  $packages = ['tcpdump']

  package { $packages :
    ensure => installed,
  }

}