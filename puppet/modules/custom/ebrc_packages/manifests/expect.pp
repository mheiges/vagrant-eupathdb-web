
# install ["expect"]
class ebrc_packages::expect {
  
  $packages = ['expect']

  package { $packages :
    ensure => installed,
  }

}