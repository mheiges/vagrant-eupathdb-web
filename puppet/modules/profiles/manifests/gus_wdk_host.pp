# Manage infrastructure for hosting WDK applications. For example, TemplateDB.

class profiles::gus_wdk_host {

  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_test_stack
  include ::ebrc_ant

  Class['::profiles::ebrc_java_stack'] -> Class['profiles::ebrc_test_stack']
}