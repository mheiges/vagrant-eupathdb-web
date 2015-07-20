
# install ["lsof"]
class ebrc_packages::lsof {
  
  $packages = ['lsof']

  package { $packages :
    ensure => installed,
  }

}