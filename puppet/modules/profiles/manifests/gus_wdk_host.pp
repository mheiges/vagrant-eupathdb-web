# Manage infrastructure for hosting WDK applications. For example, TemplateDB.

class profiles::gus_wdk_host {

  include ::ebrc_yum_repo
  include ::profiles::apidb_ca_bundle
  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat

#  include ::profiles::ebrc_test_stack
#  include ::ebrc_ant

#  Class ['::ebrc_yum_repo'] -> Class['::profiles::ebrc_java_stack']
#  Class['::profiles::apidb_ca_bundle'] -> Class['::profiles::ebrc_java_stack']

#  Class['::profiles::ebrc_java_stack'] -> Class['profiles::ebrc_test_stack']
}