
# install ["aspell"]
class ebrc_packages::aspell {
  
  $packages = ['aspell']

  package { $packages :
    ensure => installed,
  }

}