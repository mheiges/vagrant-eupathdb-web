
# install ["vim-enhanced"]
class ebrc_packages::vim-enhanced {
  
  $packages = ['vim-enhanced']

  package { $packages :
    ensure => installed,
  }

}