
# install ["emacs"]
class ebrc_packages::emacs {
  
  $packages = ['emacs']

  package { $packages :
    ensure => installed,
  }

}