" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" === Basic Setup ===
" better default
Plug 'liuchengxu/vim-better-default'
" color, look and feel 
Plug 'tomasr/molokai'
" better preview window for suggestion/ auto-complete 
Plug 'ncm2/float-preview.nvim'

" === Highlight ===
" Syntax highlight for JUST
Plug 'NoahTheDuke/vim-just'
" Syntax highlight for Clojure
Plug 'clojure-vim/clojure.vim'
" Syntax highlight for fennel language
Plug 'bakpakin/fennel.vim'
" rainbow parentheses
Plug 'frazrepo/vim-rainbow'

" === Fennel (Config) Support ===
Plug 'Olical/nfnl'
" Fennel local config
Plug 'Olical/nvim-local-fennel'

" === Interactive Development ===
" Conjure
Plug 'Olical/conjure', {'tag': 'v4.53.0'}

" === S-expression editing ===
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

" === Linter === 
Plug 'w0rp/ale'

" === Search Utility === 
" Ack inside nvim
Plug 'mileszs/ack.vim'
" Fuzzy search
Plug 'cloudhead/neovim-fuzzy'

call plug#end()

" Make nvim automatically compile all the fennel files
let g:aniseed#env = v:true
" Make vim-sexp recognizes the fennel
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,fennel'
" Config the rainbow-parentheses
let g:rainbow_ctermfgs = [
    \ 'red',
    \ 'yellow',
    \ 'green',
    \ 'cyan',
    \ 'magenta',
    \ 'gray'
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
" Make the <Esc> key exit terminal mode and return to normal mode.
tnoremap <Esc> <C-\><C-n>

" Force vim-better-default/plugin/default.vim get evaluated right away, so 
" as to overwrite it. 
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

function! LoadHiccup()
 execute "ConjureEval (require '[taipei-404.html :refer [html->hiccup]])"
endfunction

" default yaml setup
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable
" rainbow parentheses enabled for fennel
autocmd FileType fennel,clojure call rainbow#load()


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

function! AutoConjureSelect()
  let shadow_build_id = luaeval("require('auto-conjure').shadow_build_id()")
  let cmd='ConjureShadowSelect ' . shadow_build_id
  execute cmd
endfunction
command! AutoConjureSelect call AutoConjureSelect()
autocmd BufReadPost *.cljs :AutoConjureSelect
