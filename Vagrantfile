# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Maybe I will try vagrant box from https://roboxes.org/ later.
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20190325.0.0"

  # for vagrant plugin vagrant-disksize
  config.disksize.size = '50GB'

  # All configurations use 10.20.30.40 as entry.
  config.vm.network "private_network", ip: "10.20.30.40"
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 10080, host: 10080

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = "2"
    vb.memory = "2048"
  end

  # Let timezone in guest be same as host
  # Install timezone plugin:
  #   $ vagrant plugin install vagrant-timezone
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "Asia/Taipei"
  end

  ## Provision -- default run only once. However, it can be configuread to run always
  config.vm.provision "shell",
   path: "https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh",
   privileged: false
end
