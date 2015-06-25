# Manage infrastructure for hosting WDK applications. For example, TemplateDB.

class profiles::gus_wdk_host {

  stage { 'pre':
    before => Stage["main"],
  }

  class{ '::ebrc_yum_repo':
    stage => 'pre'
  }

  include ::profiles::ebrc_ca_bundle
  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat_instances_stack
  include ::profiles::ebrc_postgresql94
  include ::profiles::ebrc_test_stack

}