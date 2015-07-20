
# install ["rlwrap"]
class ebrc_packages::rlwrap {
  
  $packages = ['rlwrap']

  package { $packages :
    ensure => installed,
  }

}