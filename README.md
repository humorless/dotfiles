# dotfiles
The scripts that can do the quick installation of vim and related dotfiles

## how to install vim plugins
curl -sL https://raw.githubusercontent.com/humorless/dotfiles/master/install_vim_plugin.sh | sh

### Note:
for `vim-fireplace` to work properly, you need `sudo apt-get install unzip` so as to get `[ <C-D>` work.

## how to setup complete clojure dev environment on Ubuntu-based localhost
```
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt update
  sudo apt-get install ansible
  ansible-galaxy install geerlingguy.java
  ansible-galaxy install gremid.clojure
  ansible-playbook playbook.yml
```
