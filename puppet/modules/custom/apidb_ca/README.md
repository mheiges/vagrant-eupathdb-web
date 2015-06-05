
Install EuPathDB's internal Certificate Authority and add it to /etc/pki/tls/certs/ca-bundle.crt and optionally Java /etc/pki/tls/certs/cacerts

Hiera

- `eupathdb_cacert_dest`: e.g. `/etc/pki/tls/certs/apidb-ca-rsa.crt`
- `apidb_ca::java_home`

Requires 

  - Puppet modules
    - `puppetlabs-java_ks` for managing cacerts
    - `ca` for managing ca-bundle.crt

  - commands
    - `update-ca-trust` - provided by the `ca-certificates` package
      - this is required by the `openssl` package so will probably already be installed on a base system
    - `keytool` - provided by one of a JDK package
      - uses the one under `JAVA_HOME`, specifically `${apidb_ca::java_home}/bin/keytool`
      - The version of `keytool` must support the `-importcert` option (Java 5 does not).