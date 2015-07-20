
# install ["ImageMagick"]
class ebrc_packages::ImageMagick {
  
  $packages = ['ImageMagick']

  package { $packages :
    ensure => installed,
  }

}