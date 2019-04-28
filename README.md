# dotfiles
The scripts that can do the quick installation of vim and related dotfiles

Currently, the provision section of vagrantfile will install a Clojure Dev environment including vim plugin, openjdk, leiningen, autojump, nvm.

## How to install vim plugins
curl -sL https://raw.githubusercontent.com/humorless/dotfiles/master/vim/install_plugin.sh | sh

### Note:
for `vim-fireplace` to work properly, you need `sudo apt-get install unzip` so as to get `[ <C-D>` work.

## How to setup openjdk & leiningen on Ubuntu host by ansible-local
```
  # install ansible
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt update
  sudo apt-get install ansible
  # install ansible roles
  ansible-galaxy install -r requirements.yml
  # run the playbook
  # Note: the comma is the trick to specify host name directly in commandline
  ansible-playbook -i localhost, -c local playbook.yml
```
