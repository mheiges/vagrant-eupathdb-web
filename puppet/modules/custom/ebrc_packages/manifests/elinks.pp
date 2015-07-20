
# install ["elinks"]
class ebrc_packages::elinks {
  
  $packages = ['elinks']

  package { $packages :
    ensure => installed,
  }

}