# Install a package by name. This uses the instance definition from puppetlabs
# tomcat module. This just installs a version of tomcat from a package.
# It is not to be confused with 'tomcat instances' that are
# managed by the Tomcat Instance Framework.
define profiles::ebrc_tomcat_package {
  tomcat::instance{ $name:
    package_name => $name,
  }
}
