set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set autoindent
set hlsearch

colorscheme molokai
set t_Co=256

" *** Pathogen
execute pathogen#infect()
call pathogen#helptags()

" Enable filetype plugins
filetype plugin on

"let g:go_fmt_command = "goimports"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType clojure setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" stripe whitespace
autocmd FileType clojure,go autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

let g:ale_linters = {'clojure': ['clj-kondo']}
" Let \e to execute current line as command in bash
autocmd FileType markdown nmap <leader>e :.w !bash<CR>
" Let \t to open NERDTree
nnoremap <leader>t :NERDTree<CR>

" Let cljfmt to format *.cljs files everytime when saving
au BufWritePost *.cljs !cljfmt -w %
