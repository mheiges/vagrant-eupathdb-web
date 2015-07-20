
# install ["git"]
class ebrc_packages::git {
  
  $packages = ['git']

  package { $packages :
    ensure => installed,
  }

}