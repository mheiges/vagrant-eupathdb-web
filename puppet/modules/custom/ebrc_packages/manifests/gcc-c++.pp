
# install ["gcc-c++"]
class ebrc_packages::gcc-c++ {
  
  $packages = ['gcc-c++']

  package { $packages :
    ensure => installed,
  }

}