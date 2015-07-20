
# install ["emacs-nox"]
class ebrc_packages::emacs-nox {
  
  $packages = ['emacs-nox']

  package { $packages :
    ensure => installed,
  }

}