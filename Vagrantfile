
args = {}
#args[:hostname] = ARGV[1] || 'sa.apidb.org'
args[:hostname] = 'sa.apidb.org'

Vagrant.configure('2') do |config|

  # ansible needs agent forward
  config.ssh.forward_agent = true

	config.vm.box = 'puppetlabs/centos-6.6-64-puppet'
  config.vm.box_url = 'https://atlas.hashicorp.com/puppetlabs/boxes/centos-6.6-64-puppet'

#  if Vagrant.has_plugin?('landrush')
#   config.landrush.enabled = true
#   config.landrush.tld = 'vm'
#  end

  config.vm.define args[:hostname] do |virtm|

    config.vm.network :private_network, type: :dhcp
    config.vm.synced_folder ".", "/vagrant", type: :nfs

    config.vm.hostname = "#{args[:hostname]}" 

    config.vm.network :forwarded_port, guest: 80, host: 1080, auto_correct: true
    config.vm.network :forwarded_port, guest: 443, host: 10443, auto_correct: true

    config.vm.provision :ansible do |ansible|
      ansible.playbook = "playbook.yml"
    end

#     config.vm.provision :puppet do |puppet|
#       #puppet.options = '--disable_warnings=deprecations'
#       puppet.manifests_path = 'puppet/manifests'
#       puppet.manifest_file = ''
#       puppet.hiera_config_path = 'puppet/hiera.yaml'
#       puppet.module_path = ['puppet/modules', 'puppet/modules/forge', 'puppet/modules/custom']
#     end
    config.vm.provision :puppet do |puppet|
      #puppet.options = '--verbose --debug'
      puppet.hiera_config_path = 'puppet/hiera.yaml'
      puppet.environment_path = 'puppet/environments'
      puppet.environment = 'production'
    end


    config.vm.provider :virtualbox do |v|
      v.name = "#{args[:hostname]}"
    end

  end

end
