
# install ["gdb"]
class ebrc_packages::gdb {
  
  $packages = ['gdb']

  package { $packages :
    ensure => installed,
  }

}