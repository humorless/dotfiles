# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Maybe I will try vagrant box from https://roboxes.org/ later.
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_version = "20200326.0.0"

  # for vagrant plugin vagrant-disksize
  config.disksize.size = '50GB'

  # All configurations use 10.20.30.40 as entry.
  config.vm.network "private_network", ip: "10.20.30.40"
  # Create a forwarded port mapping which allows access to a specific port
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

  ## Provision -- default run only once.
  ## vagrant provision --provision-with nvm
  config.vm.provision "nvm", type: "shell",
    path: "https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh",
    privileged: false
  ## vagrant provision --provision-with npm
  config.vm.provision "npm", type: "shell",
    inline: "apt-get update && apt-get -y install npm",
    privileged: true
  ## vagrant provision --provision-with unzip
  config.vm.provision "unzip", type: "shell",
    inline: "sudo apt-get install unzip",
    privileged: false
  ## vagrant provision --provision-with vim
  ## Equivalent to `curl -o- https://raw.githubusercontent.com/humorless/dotfiles/master/vim/install_plugin.sh | bash`
  config.vm.provision "vim", type: "shell",
    path: "https://raw.githubusercontent.com/humorless/dotfiles/master/vim/install_plugin.sh",
    privileged: false
  ## vagrant provision --provision-with vim8
  config.vm.provision "vim8", type: "shell",
    inline: "add-apt-repository ppa:jonathonf/vim && apt-get -y update && apt-get -y install vim",
    privileged: true
  ## vagrant provision --provision-with boot
  config.vm.provision "boot", type: "shell",
    inline: "cd /usr/local/bin && curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh && chmod 755 boot",
    privileged: true
  ## vagrant provision --provision-with lein
  config.vm.provision "lein", type: "shell",
    inline: "cd /usr/local/bin && curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein && chmod a+x /usr/local/bin/lein",
    privileged: true
  ## vagrant provision --provision-with java
  config.vm.provision "java", type: "shell",
    inline: "apt-get -y install openjdk-8-jre-headless",
    privileged: true
  ## vagrant provision --provision-with lein-config-file
  config.vm.provision "lein-config-file", type: "file",
    source: "./lein/profiles.clj",
    destination: "~/.lein/profiles.clj"

  ## vagrant provision --provision-with bash-alias-file
  ## config.vm.provision "bash-alias-file", type: "file",
  ##  source: "./bash/bash_aliases",
  ##  destination: "~/.bash_aliases"

  ## autojump is likely to fail because apt-get cannot locate package
  ## vagrant provision --provision-with autojump
  config.vm.provision "autojump", type: "shell",
    inline: "sudo apt-get update && sudo apt-get install autojump && echo \". /usr/share/autojump/autojump.sh\" >> /home/vagrant/.bashrc",
    privileged: false
  ## vagrant provision --provision-with cljfmt
  config.vm.provision "cljfmt", type: "shell",
    inline: "npm install -g node-cljfmt",
    privileged: true
  ## Ansible is not as good as I originally thought
  ## vagrant provision --provision-with ansible_local
  #config.vm.provision "ansible_local" do |ansible|
  #  ansible.playbook = "playbook.yml"
  #  ansible.galaxy_role_file = "requirements.yml"
  #  ansible.verbose = true
  #end
end
