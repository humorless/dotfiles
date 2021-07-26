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
### leiningen
```
sdk install leiningen
```
### brew
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
### clojure CLI tools
```
brew install clojure/tools/clojure
```
### boot
```
brew install boot-clj
```
### babashka
```
brew install borkdude/brew/babashka
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
brew install node
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
