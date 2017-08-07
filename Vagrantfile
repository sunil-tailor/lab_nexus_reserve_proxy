# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "public_network"
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  config.vm.network "forwarded_port", guest: 81, host: 81, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 443, host: 8443, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8081, host: 8081, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8082, host: 8082, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 8083, host: 8083, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
     # Customize the amount of memory on the VM:
     vb.memory = "2048"
     vb.cpus = "2"
  end


  config.vm.provision :docker
  config.vm.provision :docker_compose

  #,
  #    yml: "/Users/sunil/devops/docker/lab_nexus_reverse_proxy/docker-compose.yaml",
  #    run: "always"

  # Equivalent to running
  # docker-compose -f [yml] up -d

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # echo pwd
  # whoami
  #    sed -i 's/127.0.0.1 localhost/127.0.0.1 localhost nexus.cards.idx.zone/g' /etc/hosts
  # SHELL
end
