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

" === Interactive Development ===
" Conjure
Plug 'Olical/conjure', {'tag': 'v4.55.0'}
" Conjure client for piglet
Plug 'humorless/conjure-client-piglet'
Plug 'humorless/auto-conjure'

" === S-expression editing ===
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'kylechui/nvim-surround'
Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }

" === Linter === 
Plug 'w0rp/ale'

" === Search Utility === 
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
" Telescope dependencies: plenary, rg, fd
Plug 'nvim-lua/plenary.nvim'
" brew install ripgrep
" brew install fd

call plug#end()

lua vim.cmd("let $NVIM_LOG_FILE=expand('~/.cache/nvim/log')")
lua vim.cmd("set verbosefile=~/.cache/nvim/log")
 
" Make vim-sexp recognizes the fennel
let g:sexp_filetypes = 'clojure,scheme,lisp,fennel,piglet'
lua require("nvim-surround").setup()
" setup path for luarock
lua require("luarocks").add_luarocks_paths()

" setup for piglet 
lua require("conjure-client-piglet").setup()
"let g:conjure#debug = v:true

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
" Make the <Esc> key exit terminal mode and return to normal mode.
tnoremap <Esc> <C-\><C-n>

let mapleader="\\"
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
autocmd FileType piglet,fennel,clojure call rainbow#load()


autocmd BufNewFile,BufRead *bin/dev set filetype=clojure
autocmd BufNewFile,BufRead *bin/launchpad set filetype=clojure
autocmd BufNewFile,BufRead *bin/proj set filetype=clojure
autocmd BufNewFile,BufRead *.bb set filetype=clojure
autocmd BufWritePost *.cljs call Cljfmt()
autocmd BufWritePost *.cljc call Cljfmt()
autocmd BufWritePost *.clj call Cljfmt()
autocmd BufWritePost *.boot call Cljfmt()
autocmd BufWritePost *.edn call Cljfmt()

function! AutoConjureSelect()
  let shadow_build_id = luaeval("require('auto-conjure').shadow_build_id()")
  let cmd='ConjureShadowSelect ' . shadow_build_id
  execute cmd
endfunction
command! AutoConjureSelect call AutoConjureSelect()
autocmd BufReadPost *.cljs :AutoConjureSelect

augroup FennelOnSave
  " Format and compile after save
  autocmd!
  autocmd BufWritePost *.fnl call Fnlfmt() | NfnlCompileFile
augroup END
