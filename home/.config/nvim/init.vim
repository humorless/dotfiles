" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.

" better default
Plug 'liuchengxu/vim-better-default'

" vim just syntax
Plug 'NoahTheDuke/vim-just'
" Syntax highlights
Plug 'clojure-vim/clojure.vim'

" Conjure
Plug 'Olical/conjure', {'tag': 'v4.38.0'}
" Fennel local config
Plug 'Olical/nvim-local-fennel'
Plug 'Olical/aniseed'

" s-expression editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

" rainbow parentheses
Plug 'amdt/vim-niji'

" linter 
Plug 'w0rp/ale'

" better preview window for suggestion/ auto-complete 
Plug 'ncm2/float-preview.nvim'

" syntax highlight for fennel language
Plug 'bakpakin/fennel.vim'

" color, look and feel 
Plug 'tomasr/molokai'

" install ack
Plug 'mileszs/ack.vim'
Plug 'mpyatishev/vim-sqlformat'

" Install fuzzy search
Plug 'cloudhead/neovim-fuzzy'

call plug#end()

" Place configuration AFTER `call plug#end()`!
"
let g:conjure#client#fennel#aniseed#aniseed_module_prefix = "aniseed."
let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker']
      \}
let maplocalleader=","
" let g:conjure#filetype#fennel = "conjure.client.fennel.stdio"
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

function! CljfmtSlow()
 !clojure -Sdeps '{:deps {dev.weavejester/cljfmt {:mvn/version "0.10.6"}}}' -m cljfmt.main fix %
 " :e is to force reload the file after it got formatted.
 :e
endfunction

function! LoadHiccup()
 execute(ConjureEval (require '[taipei-404.html :refer [html->hiccup]]))
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
" autocmd BufWritePost *.cljs call Cljfmt()
autocmd BufWritePost *.clj call Cljfmt()
autocmd BufWritePost *.boot call Cljfmt()
autocmd BufWritePost *.edn call Cljfmt()


iabbrev @@ laurence@replware.dev


