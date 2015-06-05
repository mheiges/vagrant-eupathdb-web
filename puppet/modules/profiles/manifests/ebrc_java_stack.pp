# Full java deployment for EuPathDB BRC servers
class profiles::ebrc_java_stack {

  include ::ebrc_yum_repo
  include ::ebrc_java
  include ::apidb_ca

  Class['::ebrc_yum_repo'] -> Class['::ebrc_java'] -> Class['::apidb_ca']

}
