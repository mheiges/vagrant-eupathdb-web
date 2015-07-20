
# install ["graphviz"]
class ebrc_packages::graphviz {
  
  $packages = ['graphviz']

  package { $packages :
    ensure => installed,
  }

}