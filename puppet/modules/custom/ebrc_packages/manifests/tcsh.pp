
# install ["tcsh"]
class ebrc_packages::tcsh {
  
  $packages = ['tcsh']

  package { $packages :
    ensure => installed,
  }

}