" set the runtime path to include Vundle and initialize
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
Plugin 'jnurmine/Zenburn'
call vundle#end()            " required
filetype plugin indent on    " required

" My setting
let mapleader=" "
set clipboard=unnamedplus
set number
set hlsearch
set splitbelow
set splitright
"set encoding=utf-8

" My key mapping
"" Source my .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>
"" Edit my vimrc
:nnoremap <leader>ev :vsp $MYVIMRC<cr>
"" Quick quit
:nnoremap <leader>q :q<cr>
:nnoremap <leader>Q :q!<cr>
"" Move line up and down
"nnoremap <leader>- ddp 
"nnoremap <leader>_ ddkP
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==
inoremap <a-j> <esc>:m .+1<cr>==gi
inoremap <a-k> <esc>:m .-2<cr>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <a-k> :m '<-2<cr>gv=gv
"" Change current word to upper case
inoremap <c-u> <esc>viwUei
nnoremap <c-u> viwUe<esc>
"" Wrap current word with quotes and double-quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
"" Duplicate current line
nnoremap <leader>d 0vg_y<esc>o<esc>p
"" Wrap selected text with quotes and double quotes
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
"" Quick move to begining and end of current line
nnoremap H ^
nnoremap L $
"" Quick moving in Insert mode
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Right> <nop>
inoremap <Left> <nop>


" Abbreviations
iabbrev adn and
iabbrev wath what
iabbrev tehn then
iabbrev @@ tanle2207@gmail.com


" Colors
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"call togglebg#map("<F5>")
"let maplocalleader=" "
" Python
"au Filetype python nnoremap <buffer><localleader>c I#<esc>
