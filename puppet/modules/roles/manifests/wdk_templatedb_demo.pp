# Provision a host that demonstrates the WDK-Strategies TemplateDB.
# Includes development tools to build from WDK source code and
# Postgresql server to host template data. The HTTP port for the
# Tomcat instance is open in the firewall. There is no Apache HTTP Server
# fronting so web access is through the 9380 Tomcat instance port.

class roles::wdk_templatedb_demo {

  include ::profiles::gus_wdk_development_host
  include ::profiles::ebrc_postgresql94_jdbc
  include ::profiles::ebrc_postgresql94_client
  include ::profiles::ebrc_postgresql94_server
  include ::ebrc_packages::emacs

  $global = hiera('tomcat_instance_framework::global')

  file { "${global['instances_dir']}/TemplateDB/shared/lib/postgresql-jdbc.jar":
    source  => '/usr/share/java/postgresql94-jdbc.jar',
    links   => 'follow',
    require => Class['profiles::ebrc_postgresql94_jdbc'],
    notify  => Service["tcif-TemplateDB"],
  }

  firewall { '100 allow http':
    chain  => 'INPUT',
    state  => ['NEW'],
    dport  => '80',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '100 allow https':
    chain  => 'INPUT',
    state  => ['NEW'],
    dport  => '443',
    proto  => 'tcp',
    action => 'accept',
  }

  # TEMP FOR TESTING
  firewall { '100 allow tomcat instance':
    chain  => 'INPUT',
    state  => ['NEW'],
    dport  => '9380',
    proto  => 'tcp',
    action => 'accept',
  }
}