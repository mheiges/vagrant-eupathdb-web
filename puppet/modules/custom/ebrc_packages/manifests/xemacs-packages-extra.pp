
# install ["xemacs-packages-extra"]
class ebrc_packages::xemacs-packages-extra {
  
  $packages = ['xemacs-packages-extra']

  package { $packages :
    ensure => installed,
  }

}