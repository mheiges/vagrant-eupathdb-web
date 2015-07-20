# install PostgreSQL client per EuPathDB BRC specifications

class profiles::ebrc_postgresql94_client {

  contain 'postgresql::globals'
  contain 'postgresql::client'

}