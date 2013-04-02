" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on
"------------------------------------------------------------
" Must have options {{{1
" Allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way.
set hidden
" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

"Show number line on the left
 set number
 set history=100
 " Options to match the use with konsole
 autocmd BufReadPost * :silent !dcop $KONSOLE_DCOP_SESSION renameSession %
 autocmd VimLeavePre * :silent !dcop $KONSOLE_DCOP_SESSION renameSession $PWD

 set showmatch
 autocmd BufWritePre * :%s/\s\+$//e
 set updatetime=100
 set smartindent " Auto indentation for C-like languages
 :syntax enable
 filetype plugin indent on
 :set autoindent
 :colorscheme wombat256mod
 " When F5 is pressed, a list of opened buffers is shown, and we just need to type the number to go there.
 :nnoremap <F12> :buffers<CR>:buffer<Space>
 " Highlight the line the cursor is on
" Quickly switch between buffers with CTRL+b
map <C-b> :b#<Cr>
set cursorline
" The following section of the file comes from https://defuse.ca/vimrc.htm
" Always show the last line on the screen, even when it's too long (gets
" rid of the annoying @@@@@ crap)
set display+=lastline

" Always show the status line
set laststatus=2
" Status line content
"set statusline=%n:\ %F\ [%{&ff}]%y%m%h%w%r\ %=char=0x%B\ \ \ x=%v\ y=%l/%L\ -\ %p%%\
set statusline=%n:\ %F\ [%{&ff}]%y%m%h%w%r\ %=\[column:\ %v]\ [line:\ %l\ of\ %L\ \(%p%%\)]
" Spell checking
setglobal spell spelllang=en_gb
" By default spelling is off...
set nospell
" ...but enable it for the English text files I use a lot.
au BufRead,BufNewFile,BufWrite *.txt,*.tex,*.latex set spell
let vimrc_already_sourced = 1

"Don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Setup Pathogen to manage my plugins
"call pathogen#infect()

" Set the font globally
set guifont=DejaVu\ Sans\ Mono\ Bold\ 11
