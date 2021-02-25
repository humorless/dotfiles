" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.

" better default
Plug 'liuchengxu/vim-better-default'

" Conjure
Plug 'Olical/conjure', { 'tag': 'v4.14.0' }

" s-expression editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
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
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }
call plug#end()

" Place configuration AFTER `call plug#end()`!

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker']
      \}
let maplocalleader=","
" let g:conjure#filetype#fennel = "conjure.client.fennel.stdio"
let g:ackprg = 'ack --nogroup --nocolor --column'
let g:LanguageClient_serverCommands = {
    \ 'clojure': ['/usr/local/bin/clojure-lsp'],
    \ }

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> <LocalLeader>r <Plug>(lcn-references)
nmap <silent> gd <Plug>(lcn-definition)
" "nmap <silent> <F2> <Plug>(lcn-rename)

tnoremap <Esc> <C-\><C-n>
runtime! plugin/default.vim
set nonu
set norelativenumber
colorscheme molokai

" You need to press :e after :w if you want to reload the formatted file
autocmd BufWritePost *.clj !cljfmt -w %
autocmd BufWritePost *.cljs !cljfmt -w %
