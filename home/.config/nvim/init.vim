" Specify a directory for plugins.
call plug#begin(stdpath('data') . '/plugged')

" Specify your required plugins here.

" better default
Plug 'liuchengxu/vim-better-default'

" Conjure
Plug 'Olical/conjure', { 'tag': 'v4.14.0' }
" fennel & aniseed
Plug 'Olical/nvim-local-fennel'
Plug 'Olical/aniseed'

" s-expression editing
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
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

" note that if you are using Plug mapping you should not use `noremap` mappings.
" nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nmap <silent> <LocalLeader>r <Plug>(lcn-references)

tnoremap <Esc> <C-\><C-n>
runtime! plugin/default.vim
set nonu
set norelativenumber
colorscheme molokai

function! Cljfmt()
 !cljfmt -w %
 "!clojure -Sdeps '{:deps {cljfmt {:mvn/version "0.8.0"}}}' -m cljfmt.main fix %
 " :e is to force reload the file after it got formatted.
 :e
endfunction


function! CljfmtSlow()
 !clojure -Sdeps '{:deps {cljfmt {:mvn/version "0.8.0"}}}' -m cljfmt.main fix %
 " :e is to force reload the file after it got formatted.
 :e
endfunction

function! Sqlfmt()
 !sqlformat --reindent --keywords upper --identifiers lower % -o %
 :e
endfunction

"autocmd BufWritePost *.clj call Cljfmt()
autocmd BufWritePost *.cljs call Cljfmt()
