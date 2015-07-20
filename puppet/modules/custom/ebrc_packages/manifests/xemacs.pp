
# install ["xemacs"]
class ebrc_packages::xemacs {
  
  $packages = ['xemacs']

  package { $packages :
    ensure => installed,
  }

}