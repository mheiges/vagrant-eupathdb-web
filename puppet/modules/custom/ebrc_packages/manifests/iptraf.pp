
# install ["iptraf"]
class ebrc_packages::iptraf {
  
  $packages = ['iptraf']

  package { $packages :
    ensure => installed,
  }

}