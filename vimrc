syntax enable
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'scrooloose/nerdtree'
  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
"  Plugin 'tpope/vim-fugitive'
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  
  
  set nocompatible
set cindent
set ttyfast
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nobackup
set writebackup
set incsearch
set title
set expandtab
set cursorline
   
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
set showmode
set number
set ignorecase
set smartcase
set wildmenu
set nowrap
set laststatus=2
set background=dark
"set t_Co=16
colorscheme solarized
let g:solarized_termcolors=256
" color overlong lines
highlight ColorColumn ctermbg=black ctermfg=darkred guibg=red
execute "set colorcolumn=" . join(range(79, 256), ',')

" Highlight trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

autocmd bufnewfile *.c so /home/ianlittke/c_header.txt

set makeprg=gcc\ -g\ -Wall\ %\ &&\ ./a.out
