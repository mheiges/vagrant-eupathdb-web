
# install ["perl-YAML"]
class ebrc_packages::perl_yaml {
  
  $packages = ['perl-YAML']

  package { $packages :
    ensure => installed,
  }

}