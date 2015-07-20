
### About

A playground for developing a Vagrant setup of a EuPathDB webserver. **_Do not use._**

### Install

* Download and install [Vagrant](https://www.vagrantup.com/downloads.html)
* Download and install  [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* Clone the project ```git clone git@github.com:mheiges/vagrant-rabbitmq.git```
* In the project dir run ```vagrant up```

### Installed Services

#### None

Nothing is functional at this time.

#### Puppet

Puppet manifests are applied during `vagrant provision`. To manually apply manifests on the VM, run:

    sudo puppet apply --hiera_config=/vagrant/puppet/hiera.yaml --modulepath=/vagrant/puppet/modules:/vagrant/puppet/modules/forge:/vagrant/puppet/modules/custom:/vagrant/puppet/locations:/vagrant/puppet/projects  /vagrant/puppet/manifests


### ToDO
