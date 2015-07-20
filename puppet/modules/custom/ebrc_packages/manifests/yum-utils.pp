
# install ["yum-utils"]
class ebrc_packages::yum-utils {
  
  $packages = ['yum-utils']

  package { $packages :
    ensure => installed,
  }

}