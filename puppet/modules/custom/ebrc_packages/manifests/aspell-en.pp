
# install ["aspell-en"]
class ebrc_packages::aspell-en {
  
  $packages = ['aspell-en']

  package { $packages :
    ensure => installed,
  }

}