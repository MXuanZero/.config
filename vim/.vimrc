" $VIMRUNTIME refers to the versioned system directory where Vim stores its
" system runtime files -- /usr/share/vim/vim<version>.
"
" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
"
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1
"
" If you would rather _use_ default.vim's settings, but have the system or
" user vimrc override its settings, then uncomment the line below.
" source $VIMRUNTIME/defaults.vim

" All Debian-specific settings are defined in $VIMRUNTIME/debian.vim and
" sourced by the call to :runtime you can find below.  If you wish to change
" any of those settings, you should do it in this file or
" /etc/vim/vimrc.local, since debian.vim will be overwritten everytime an
" upgrade of the vim packages is performed. It is recommended to make changes
" after sourcing debian.vim so your settings take precedence.

runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes
" numerous options, so any other options should be set AFTER changing
" 'compatible'.
set clipboard=unnamed,unnamedplus " 使用系统剪切板

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on


" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=light
colorscheme slate

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set laststatus=2 	" 显示状态栏 (默认值为 1, 无法显示状态栏)
set smartindent 	" 开启新行时使用智能自动缩进
set t_vb= 		" 置空错误铃声的终端代码
set number		" 显示行号

nnoremap x "_x
nnoremap X "_X
nnoremap dd "_dd
nnoremap D "_D
nnoremap H ^
nnoremap L g_
nnoremap <C-V> "_dP
nnoremap <C-v> "_dP
nnoremap <C-z> u
nnoremap <C-x> cc<esc>
nnoremap <C-c> yy
nnoremap <C-s> :w<cr>
nnoremap <A-down> :belowright term<cr>

inoremap jj <esc>
inoremap <C-x> <esc>cc
inoremap <C-z> <esc>ui
inoremap <C-s> :w<cr>

vnoremap x "_x
vnoremap X "_X
vnoremap dd "_d
vnoremap D "_D
vnoremap c "_c
vnoremap C "_C
vnoremap <C-V> "_dP
vnoremap <C-v> "_dP
vnoremap <C-z> u
vnoremap <C-x> c<esc>
vnoremap <C-c> y
vnoremap <C-s> :w<cr>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

