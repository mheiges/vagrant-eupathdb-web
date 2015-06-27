Install [EupathDB's Tomcat Instance Framework](https://github.com/EuPathDB/tomcat-instance-framework)

Attempting to disable when both and active and inactive instance directories exist (say, because someone managed things outside of Puppet) will raise an error.

####`ensure`

  - `present` or `enabled` - The instance exists and is running. This is the default. If the instance does not exist it will be created and started. If the instance exists in a disabled state it will be enabled and started.
  - `absent` - The instance does not exist. It will be shutdown and deleted if necessary.
  - `disabled` - The instance exists but is renamed with a leading underscore (`_`) so it will be ignored by `instance_manager` and will not be managed with the `tomcat` service. Puppet will shutdown the instance before disabling if necessary. A disable instance will still receive configuration updates. If the instance is not present on the system it will be created and then disabled.
