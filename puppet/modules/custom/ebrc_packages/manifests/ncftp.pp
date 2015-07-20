
# install ["ncftp"]
class ebrc_packages::ncftp {
  
  $packages = ['ncftp']

  package { $packages :
    ensure => installed,
  }

}