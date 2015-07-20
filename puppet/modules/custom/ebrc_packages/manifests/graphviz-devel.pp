
# install ["graphviz-devel"]
class ebrc_packages::graphviz-devel {
  
  $packages = ['graphviz-devel']

  package { $packages :
    ensure => installed,
  }

}