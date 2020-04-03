# dotfiles
The scripts that can do the quick installation of vim and related dotfiles

Currently, the provision section of vagrantfile will install a Clojure Dev environment including vim plugin, leiningen, autojump, nvm.

## Use the whole virtual development environment
```
vagrant plugin install vagrant-disksize
vagrant plugin install vagrant-timezone
vagrant up
```

## Use only vim plugins 
```
curl -sL https://raw.githubusercontent.com/humorless/dotfiles/master/vim/install_plugin.sh | sh
```
### Note:
for `vim-fireplace` to work properly, you need `sudo apt-get install unzip` so as to get `[ <C-D>` work.
