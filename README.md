# dotfiles
The scripts that can do the quick installation of neovim and related dotfiles under the Mac

## Java & Clojure Dev
### sdkman
```
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
```
### java
```
sdk list java
sdk install java  ;; lastest stable version of jdk
```
### brew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### python
```
brew install pyenv
pyenv init
```

### clojure CLI tools
```
brew install clojure/tools/clojure
```
### babashka
```
brew install borkdude/brew/babashka
```
### neil
```
brew install babashka/brew/neil
```
### clj-kondo
```
brew install borkdude/brew/clj-kondo
```
### neovim
```
brew install neovim
```
## Productivity Tool

### autojump
```
brew install autojump
```
### ack-grep
```
brew install ack
```
### tmux
```
brew install tmux
```
## Node Dev & cljfmt
### nvm
```
brew install nvm
```
### npm
```
nvm install <VERSION-number>
```
ex:
```
nvm install 12.0.0
```

### cljfmt
```
npm install -g node-cljfmt
```

## Others
```
# feeling
git bash-complete
CLICOLOR, LSCOLORS, PS1
```
