set mouse=a
set nocompatible


" code to install the vimplug manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" call the addon polygot
call plug#begin()
Plug 'vim-python/python-syntax'

Plug 'sheerun/vim-polyglot'

call plug#end()


" defaults for ease of use 
set relativenumber
set number
set clipboard=unnamedplus
set nowrap
nnoremap <Space> <C-f>
nnoremap b <C-b>
