# -*- mode: ruby -*-
# vi: set ft=ruby et ts=2 sw=2:

Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 2048
    vm.cpus = 2
  end

  config.vm.box = "bento/ubuntu-17.10"

  # The following provisioning is effectively the same as running make.
  config.vm.provision :shell,
    inline: "make -C /vagrant link",
    privileged: false
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
    }
  end
end
