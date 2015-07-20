
# install ["compat-libstdc++-33"]
class ebrc_packages::compat-libstdc++-33 {
  
  $packages = ['compat-libstdc++-33']

  package { $packages :
    ensure => installed,
  }

}