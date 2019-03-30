# dotfiles
The scripts that can do the quick installation of vim and related dotfiles

## how to install vim plugins
curl -sL https://raw.githubusercontent.com/humorless/dotfiles/master/install_vim_plugin.sh | sh

## how to setup complete clojure dev environment on localhost
```
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt update
  sudo apt-get install ansible
  ansible-galaxy install geerlingguy.java
  ansible-galaxy install gremid.clojure
  ansible-playbook playbook.yml
```
## how to setup zsh
```
  # install zsh
  sudo apt-get install zsh
  chsh -s /bin/zsh
  # install Oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # install zsh-syntax-highlighting plugin
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

in `~/.zshrc`
plugins=(git z zsh-syntax-highlighting colored-man-pages)


## Note:
for `vim-fireplace` to work properly, you need `sudo apt-get install unzip` so as to get `[ <C-D>` work.
