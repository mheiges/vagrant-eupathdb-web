
# install ["subversion"]
class ebrc_packages::subversion {
  
  $packages = ['subversion']

  package { $packages :
    ensure => installed,
  }

}