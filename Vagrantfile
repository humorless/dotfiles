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
  # 3449 is the port used by lein figwheel server
  config.vm.network "forwarded_port", guest: 3449, host: 3449
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

  ## Provision -- default run only once.
  ## vagrant provision --provision-with nvm
  config.vm.provision "nvm", type: "shell",
    path: "https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh",
    privileged: false
  ## vagrant provision --provision-with autojump
  config.vm.provision "autojump", type: "shell",
    inline: "sudo apt-get install autojump && echo \". /usr/share/autojump/autojump.sh\" >> /home/vagrant/.bashrc",
    privileged: false
  ## vagrant provision --provision-with ansible_local
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.galaxy_role_file = "requirements.yml"
    ansible.verbose = true
  end
  ## vagrant provision --provision-with unzip
  config.vm.provision "unzip", type: "shell",
    inline: "sudo apt-get install unzip",
    privileged: false
  ## vagrant provision --provision-with vim
  config.vm.provision "vim", type: "shell",
    path: "https://raw.githubusercontent.com/humorless/dotfiles/master/vim/install_plugin.sh",
    privileged: false
  ## vagrant provision --provision-with file
  config.vm.provision "file", source: "./lein/profiles.clj", destination: "~/.lein/profiles.clj"
end
