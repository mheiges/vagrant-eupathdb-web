#!/bin/sh

module_path=/vagrant/puppet/modules/forge

mkdir -p "${module_path}"

for forge_module in \
                    puppetlabs-firewall \
                    stahnma-epel \
                    puppetlabs-java_ks \
                    puppetlabs-tomcat \
                    puppetlabs-postgresql \
                    puppetlabs-apache; do

  module="${forge_module#*-}"
  if [ ! -d "${module_path}/${module}" ]; then
    echo "Installing puppet module ${forge_module}."
    puppet module install --modulepath "${module_path}" "${forge_module}"
  fi

done

for ebrc_module in \
                    maven \
                    oracle; do

  if [ ! -d "${module_path}/${ebrc_module}" ]; then
    mkdir "${module_path}/${ebrc_module}"
    git archive --remote=git@git.apidb.org:puppet.git \
        HEAD:modules/${ebrc_module} | tar -x -C "${module_path}/${ebrc_module}"
  fi

done