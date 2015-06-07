# Full java deployment for EuPathDB BRC servers
# Includes
#  - installing one or more Java packages
#    - the Java packages are assumed to come from EuPathDB's YUM repo, 
#      so installs that YUM configuration.
#   - adds EuPathDB's certificate authority to cacerts keystore.
class profiles::ebrc_java_stack {

  include ::ebrc_yum_repo
  include ::profiles::apidb_ca_bundle
  include ::profiles::apidb_ca_keystore

  $java_home = hiera('ebrc_java::java_home')

  class { '::ebrc_java':
    packages  => hiera('ebrc_java::packages'),
    java_home => hiera('ebrc_java::java_home'),
  }

  Class['::ebrc_yum_repo'] ->
  Class['::ebrc_java'] ->
  Class['::profiles::apidb_ca_bundle'] ->
  Class['::profiles::apidb_ca_keystore']

}
