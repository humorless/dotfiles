" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.

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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

" rainbow parentheses
Plug 'amdt/vim-niji'
" vim-niji does not work for fennel for unknown reason, so vim-rainbow is needed
Plug 'frazrepo/vim-rainbow'

" linter 
Plug 'w0rp/ale'

" better preview window for suggestion/ auto-complete 
Plug 'ncm2/float-preview.nvim'

" color, look and feel 
Plug 'tomasr/molokai'

" Ack inside nvim
Plug 'mileszs/ack.vim'
Plug 'mpyatishev/vim-sqlformat'

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
