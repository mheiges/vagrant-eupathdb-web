
# install ["strace"]
class ebrc_packages::strace {
  
  $packages = ['strace']

  package { $packages :
    ensure => installed,
  }

}