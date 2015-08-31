# Manage minimal infrastructure for hosting WDK applications. For example, TemplateDB.

class profiles::gus_wdk_development_host {

  include ::profiles::ebrc_ca_bundle
  include ::profiles::ebrc_java_stack
  include ::profiles::ebrc_tomcat_instances_stack
  include ::profiles::ebrc_postgresql94_jdbc
  include ::profiles::ebrc_postgresql94_client
  include ::profiles::ebrc_postgresql94_server
  include ::profiles::ebrc_test_stack

  include ::maven

  include ::ebrc_packages::ant
  include ::ebrc_packages::make
  include ::ebrc_packages::gcc
  include ::ebrc_packages::subversion
  include ::ebrc_packages::npm                # GUS webinstall
  include ::ebrc_packages::nodejs             # GUS webinstall
  include ::ebrc_packages::perl_yaml          # generateFilesFromTemplates, et al.

}