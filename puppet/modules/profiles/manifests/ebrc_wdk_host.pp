# Manage infrastructure to support hosting EuPathDB WDK-based web application stack
# with Apache HTTPD server frontend.
class profiles::ebrc_wdk_host {

  contain ::apache
  contain ::ebrc_apache
  contain ::ebrc_common_web_dirs

  Class['::apache'] -> Class['ebrc_apache'] -> Class['ebrc_common_web_dirs']
}