
# install ["ftp"]
class ebrc_packages::ftp {
  
  $packages = ['ftp']

  package { $packages :
    ensure => installed,
  }

}