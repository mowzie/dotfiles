syntax enable
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'bling/vim-airline'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'sudar/vim-arduino-syntax'
  Plugin 'lervag/vim-latex'
  Plugin 'vim-pandoc/vim-pandoc-syntax'   
  Plugin 'vim-pandoc/vim-pandoc'
  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  Plugin 'airblade/vim-gitgutter'

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
set splitright
set splitbelow
set relativenumber
set number

let g:tex_flavor='latex'

"set showcmd
set ignorecase
set smartcase
set wildmenu
set nowrap
set laststatus=2
set background=dark
set t_Co=16
colorscheme solarized
let g:airline_theme='solarized'
"let g:solarized_termcolors=256
" color overlong lines
highlight ColorColumn ctermbg=black ctermfg=darkred guibg=red
execute "set colorcolumn=" . join(range(80, 256), ',')
let NERDTreeChDirMode=2
" Highlight trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

au BufNewFile,BufRead *.cpp,*.c,*.h,*.java syn region myCComment start="/\*" end="\*/" fold keepend transparent

set makeprg=gcc\ -g\ -Wall\ %\ &&\ ./a.out

function s:MDSettings()
  inoremap <buffer> <Leader>n \note[item]{}<Esc>i
  noremap <buffer> <Leader>b :! pandoc -t beamer % -o %<.pdf<CR><CR>
  noremap <buffer> <Leader>l :! pandoc -t latex % -o %<.pdf<CR>
  noremap <buffer> <Leader>v :! evince %<.pdf 2>&1 >/dev/null &<CR><CR>

  syntax region Statement oneline matchgroup=Delimiter start="$" end="$"
  syntax region Statement matchgroup=Delimiter start="\\begin{.*}" end="\\end{.*}" contains=Statement
  syntax region Statement matchgroup=Delimiter start="{" end="}" contains=Statement
endfunction

au BufRead,BufNewFile *.ino setfiletype arduino
autocmd BufRead,BufNewFile *md setfiletype markdown
autocmd FileType markdown :call <SID>MDSettings()
