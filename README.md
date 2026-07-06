# dotfiles
The scripts that can do the quick installation of neovim and related dotfiles under the Mac

## Basic
### brew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### mise
```
brew install mise
```
### neovim
```
brew install neovim
```

#### Use this neovim config

```
# Delete the current nvim config
rm -rf $HOME/.config/nvim

# Download this repo and link it
git clone https://github.com/humorless/dotfiles/
cd dotfiles
# Makes a symbolic link to the files in this repo
ls -sf $PWD/home/dot_config/nvim $HOME/.config/nvim
```

## Language
### Clojure & Babashka
```
brew install clojure/tools/clojure
brew install borkdude/brew/babashka
brew install babashka/brew/neil
brew install borkdude/brew/clj-kondo
brew install cljfmt
```
### java
```
mise ls-remote java
mise use -g java@latest  ;; lastest stable version of jdk
```
### python
```
mise ls-remote python
mise use -g python@latest  ;; lastest stable version of python
```
### node
```
mise ls-remote node
mise use -g node@latest  ;; lastest stable version of node
```
ex:
```
mise use -g node@20
```

## CLI Tools
### autojump
```
brew install autojump
```
### ripgrep
```
brew install ripgrep
```
ripgrep's config file can be specified via the `RIPGREP_CONFIG_PATH` environment variable, with one command line flag per line:
```
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
```
### tmux
```
brew install tmux
```
### tmate
```
brew install tmate
```
tmate is a fork of tmux that generates a connection string, letting others connect over the network to share the same terminal session — handy for real-time pair collaboration or remote debugging.
