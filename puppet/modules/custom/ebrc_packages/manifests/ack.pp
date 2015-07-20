
# install ["ack"]
class ebrc_packages::ack {
  
  $packages = ['ack']

  package { $packages :
    ensure => installed,
  }

}