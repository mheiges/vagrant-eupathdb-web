
# install ["graphviz-gd"]
class ebrc_packages::graphviz-gd {
  
  $packages = ['graphviz-gd']

  package { $packages :
    ensure => installed,
  }

}