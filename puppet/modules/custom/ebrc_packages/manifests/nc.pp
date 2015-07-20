
# install ["nc"]
class ebrc_packages::nc {
  
  $packages = ['nc']

  package { $packages :
    ensure => installed,
  }

}