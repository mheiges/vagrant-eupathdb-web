define profiles::ebrc_tomcat_instance {
  tomcat::instance{ $title:
    package_name => $title,
  }
}
