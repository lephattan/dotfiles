"" My shortcuts

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <leader>e :e ~/.config/nvim/init.lua<CR>
nnoremap <leader>s :so ~/.config/nvim/init.lua<CR>
" Quick save
nnoremap <leader>w :w<CR>
" Quick quit
nnoremap <leader>q :q<CR>
" Quick slipt
nnoremap <leader>vs :vs<CR>
" Quick search and replace
nnoremap <c-h> :%s///g<left><left><left>
" Search current selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" Resize shortcuts
nnoremap <leader>m :MaximizerToggle<CR>
"nnoremap <leader>m :MaximizerToggle<CR>gv 

nnoremap <silent> <leader>1 :exe "vertical resize ".&columns*1/10<cr>
nnoremap <silent> <leader>2 :exe "vertical resize ".&columns*1/5<cr>
nnoremap <silent> <leader>5 :exe "vertical resize ".&columns*1/2<cr>
nnoremap <silent> <leader>3 :exe "vertical resize ".&columns*3/10<cr>
nnoremap <silent> <leader>7 :exe "vertical resize ".&columns*7/10<cr>
nnoremap <silent> <leader>8 :exe "vertical resize ".&columns*8/10<cr>
nnoremap <leader>+ :resize +5<cr>
nnoremap <leader>- :resize -5<cr>

