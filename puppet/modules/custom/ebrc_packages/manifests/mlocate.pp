
# install ["mlocate"]
class ebrc_packages::mlocate {
  
  $packages = ['mlocate']

  package { $packages :
    ensure => installed,
  }

}