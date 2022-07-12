" Legacy autocmd waiting to be supported in lua 
"" Python PEP 8 indentation
au BufNewFile,BufRead *.py
			\ set tabstop=4
"						\ set softtabstop=4
			\ set shiftwidth=4
			\ set expandtab
			\ set autoindent
			\ set fileformat=unix

autocmd FileType vue setlocal ts=2 sw=2 sts=0 expandtab
autocmd FileType vue set filetype=vue.html
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sw=2 expandtab ai si
autocmd FileType json setlocal ts=2 sw=2 expandtab 
autocmd FileType MD, md setlocal ts=2 sw=2 expandtab
autocmd FileType liquid setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sw=2 expandtab
autocmd FileType lua setlocal ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.rules setlocal ts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 expandtab
