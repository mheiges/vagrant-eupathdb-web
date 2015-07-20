# install PostgreSQL Server per EuPathDB BRC specifications

class profiles::ebrc_postgresql94_server {

  contain 'postgresql::globals'

  class { 'postgresql::server':
    listen_addresses  => '*',
    postgres_password => hiera('postgresql::server::password'),
  }

  # TYPE  DATABASE        USER            CIDR-ADDRESS            METHOD
  # "local" is for Unix domain socket connections only
  # local   all             postgres                                ident     
  postgresql::server::pg_hba_rule { 'Unix domain socket connections for postgres':
    type        => 'local',
    database    => 'all',
    user        => 'postgres',
    auth_method => 'ident',
  }
  # local   all             all                                     password
  postgresql::server::pg_hba_rule { 'Unix domain socket connections for all':
    type        => 'local',
    database    => 'all',
    user        => 'all',
    auth_method => 'password',
  }

  # host    all             all             127.0.0.1/32            md5
  postgresql::server::pg_hba_rule { 'IPv4 local connections':
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '127.0.0.1/32',
    auth_method => 'md5',
  }

  # remote connections (allow world access here and actually control via firewall)
  # host    all             all             0.0.0.0/0          md5
  postgresql::server::pg_hba_rule { 'IPv4 remote connections':
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '0.0.0.0/0',
    auth_method => 'md5',
  }

}
