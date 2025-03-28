" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.

" better escape shortcut
""Plug 'jdhao/better-escape.vim'

" better default
Plug 'liuchengxu/vim-better-default'

" Syntax highlight for JUST
Plug 'NoahTheDuke/vim-just'

" Syntax highlight for Clojure
Plug 'clojure-vim/clojure.vim'
" Syntax highlight for fennel language
Plug 'bakpakin/fennel.vim'

" Conjure
Plug 'Olical/nfnl'
Plug 'Olical/conjure', {'tag': 'v4.53.0'}
" Fennel local config
Plug 'Olical/nvim-local-fennel'

" s-expression editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

" rainbow parentheses
Plug 'amdt/vim-niji'
" vim-niji does not work for fennel for unknown reason, so I install vim-rainbow
Plug 'frazrepo/vim-rainbow'

" linter 
Plug 'w0rp/ale'

" better preview window for suggestion/ auto-complete 
Plug 'ncm2/float-preview.nvim'

" color, look and feel 
Plug 'tomasr/molokai'

" install ack
Plug 'mileszs/ack.vim'
Plug 'mpyatishev/vim-sqlformat'

" Install fuzzy search
Plug 'cloudhead/neovim-fuzzy'

" install autocompletion framework
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" let g:deoplete#enable_at_startup = 1

call plug#end()

" Place configuration AFTER `call plug#end()`!
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,fennel'
let g:rainbow_ctermfgs = [
            \ 'red',
            \ 'yellow',
            \ 'green',
            \ 'cyan',
            \ 'magenta',
            \ 'gray',
            \ ]

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker']
      \}
let maplocalleader=","
let g:ack_default_options = ' -s -H --nogroup --nocolor --column --smart-case --follow'

" mapping for fuzzy search
nnoremap <C-p> :FuzzyOpen<CR>
" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> <LocalLeader>r <Plug>(lcn-references)
" Use the go to definition function of Conjure, not using lsp version


tnoremap <Esc> <C-\><C-n>
runtime! plugin/default.vim
set nonu
set norelativenumber
colorscheme molokai

function! Cljfmt()
 !cljfmt fix %
 " :e is to force reload the file after it got formatted.
 :e
endfunction

function! Fnlfmt()
 !fnlfmt --fix %
 " :e is to force reload the file after it got formatted.
 :e
endfunction


function! CljfmtSlow()
 !clojure -Sdeps '{:deps {dev.weavejester/cljfmt {:mvn/version "0.10.6"}}}' -m cljfmt.main fix %
 " :e is to force reload the file after it got formatted.
 :e
endfunction

function! LoadHiccup()
 execute "ConjureEval (require '[taipei-404.html :refer [html->hiccup]])"
endfunction

function! Sqlfmt()
 "`:call Sqlfmt()` to format the current sql file
 " The sqlfmt requires the installation of sqlparse
 " `pip install sqlparse`
 " `pip install sqlfluff`
  !sqlformat --reindent --keywords upper --identifiers lower % -o %
 ""!sqlfluff fix % --dialect postgres 
 :e
endfunction

function! Yamlfmt()
 " call Yamlfmt() to format the current yaml file
 " pip install yamlfix
 !yamlfix %
 :e
endfunction

" default yaml setup
setlocal sw=2 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

" rainbow parentheses enabled for fennel
autocmd FileType fennel call rainbow#load()
autocmd BufNewFile,BufRead *bin/dev set filetype=clojure
autocmd BufNewFile,BufRead *bin/launchpad set filetype=clojure
autocmd BufNewFile,BufRead *bin/proj set filetype=clojure
autocmd BufNewFile,BufRead *.bb set filetype=clojure
autocmd BufWritePost *.cljs call Cljfmt()
autocmd BufWritePost *.cljc call Cljfmt()
autocmd BufWritePost *.clj call Cljfmt()
autocmd BufWritePost *.boot call Cljfmt()
autocmd BufWritePost *.edn call Cljfmt()
autocmd BufWritePost *.fnl call Fnlfmt()

lua require('auto-conjure')
autocmd BufReadPost *.cljs :AutoConjureSelect
