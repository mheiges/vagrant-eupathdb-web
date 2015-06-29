Install [EupathDB's Tomcat Instance Framework](https://github.com/EuPathDB/tomcat-instance-framework)

Attempting to disable when both and active and inactive instance directories exist (say, because someone managed things outside of Puppet) will raise an error.

####`ensure`

  - `started` or `present` - The instance exists and has a running `jsvc` process. This is the default. If the instance does not exist it will be created and started. If the instance exists in a `stopped` state it will started.
  - `absent` - The instance directory does not exist. It will be shutdown and deleted if necessary.
  - `stopped` - The instance exists but has not running `jsvc` process. The instance directory is renamed with a leading underscore (`_`) so it will be ignored by `instance_manager` and will not be managed with the `tomcat` service. A disable instance will still receive configuration updates. If the instance is not present on the system it will be created and then set to the `stopped` state.
