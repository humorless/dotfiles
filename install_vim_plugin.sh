#!/bin/sh

# install .vimrc
curl -o ~/.vimrc https://raw.githubusercontent.com/humorless/dotfiles/master/vimrc

# prepare vim pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install molokai
# for molokai syntax highlight
mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/molokai.vim   https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

# install NERDTree
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

#####################################
# setup js related vim plugin
#####################################

# vim plugin for javascript and jsx
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx

# vim plugin for ternjs, required npm
cd ~/.vim/bundle/   && git clone https://github.com/ternjs/tern_for_vim.git
cd ~/.vim/bundle/tern_for_vim  && npm install
# use :TernDef, :TernRefs, TernRename

#####################################
# setup python related vim plugin
#####################################

# vim plugin for python PEP8 style checker
git clone https://github.com/nvie/vim-flake8.git ~/.vim/bundle/vim-flake8
git clone https://github.com/tell-k/vim-autopep8.git ~/.vim/bundle/vim-autopep8

#####################################
# setup clojure related vim plugin
#####################################

cd ~/.vim/bundle
# setup fireplace, the most important REPL-driven weapon
git clone https://github.com/tpope/vim-fireplace.git

# setup differenct version of vim rainbow parentheses
git clone https://github.com/vim-scripts/vim-niji.git

# vim-sexp will maintain the balanced state of matched character
git clone git://github.com/tpope/vim-sexp-mappings-for-regular-people.git
git clone git://github.com/guns/vim-sexp.git
git clone git://github.com/tpope/vim-repeat.git
git clone git://github.com/tpope/vim-surround.git

# clojure static -> syntax highlight & indentation
git clone https://github.com/guns/vim-clojure-static.git
git clone https://github.com/venantius/vim-cljfmt.git
# automatic clojure require
git clone https://github.com/guns/vim-slamhound.git

# strip whitespace
git clone https://github.com/ntpeters/vim-better-whitespace.git
# after install vim-better-whitespace, you can use :StripWhitespace to remove white space
