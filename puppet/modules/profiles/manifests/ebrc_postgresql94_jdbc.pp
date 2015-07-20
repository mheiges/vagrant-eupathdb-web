# install PostgreSQL Java JDBC drivers per EuPathDB BRC specifications

class profiles::ebrc_postgresql94_jdbc {

  contain 'postgresql::globals'
  contain 'postgresql::lib::java'

}
