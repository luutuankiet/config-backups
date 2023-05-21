set nocompatible              " be iMproved, required
filetype off                  " required



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set mouse=a
set nocompatible
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'vim-python/python-syntax'

Plug 'sheerun/vim-polyglot'

call plug#end()

set number
set relativenumber
set clipboard=unnamedplus " use the clipboards of vim and win - This setting allows you to use the system clipboard in Vim. When you yank (copy) a text selection in Vim, it will automatically be added to the system clipboard, so you can paste it into other applications using your usual clipboard shortcut
set paste " paste from a windows or from vim - This setting tells Vim to use "paste mode" when pasting text. Normally, when you paste text in Vim, it tries to interpret the contents of the clipboard as commands to execute within Vim. This can lead to strange behavior if you're just trying to paste plain text. With `set paste`, Vim will just paste the text as-is, without interpreting any commands.
set go+=a " visual selection automatically copied to the clipboard - This setting automatically adds any text you visually select in Vim to the system clipboard. Normally, you would need to explicitly copy the selected text to the clipboard using the `y` command. With this setting, any visual selection you make in Vim will automatically be copied to the clipboard, without you having to do anything else.
