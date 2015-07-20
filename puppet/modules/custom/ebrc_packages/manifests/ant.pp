
# install ["ant", "ant-contrib", "xml-commons-apis"]
class ebrc_packages::ant {
  
  $packages = ['ant', 'ant-contrib']

  package { $packages :
    ensure => installed,
  }

  # ant requires xml-commons-apis.
  # Oracle jdk lies that it provides that feature.
  # Set allow_virtual to false to install the
  # separate xml-commons-apis package.
  package { 'xml-commons-apis' :
    ensure        => installed,
    allow_virtual => false,
  }

}
