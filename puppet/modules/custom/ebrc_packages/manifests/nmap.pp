
# install ["nmap"]
class ebrc_packages::nmap {
  
  $packages = ['nmap']

  package { $packages :
    ensure => installed,
  }

}