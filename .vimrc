" Add pathogen plugin support
execute pathogen#infect()

" Allow file-type based indentation
filetype plugin indent on

" This must be first, because it changes other options as a side effect
set nocompatible

" ===============
" BACKUP SETTINGS
" ===============
" Keep a backup file (restore to previous version)
set backup
" Keep an undo file (undo changes after closing)
set undofile
" Store all backup and swapfiles in its own directory
set backupdir=~/swapfiles
set undodir=~/swapfiles
set dir=~/swapfiles

" ===============
" EDITOR SETTINGS
" ===============
"Turn on syntax
syntax on
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Do incremental searching
set incsearch
" Add numbers by default
set number
" Indent settings
set autoindent
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Encoding settings
set encoding=utf-8
" Show matching braces
set showmatch
" Show filepath in title
set title
" Highlight search pattern
set hlsearch
" Keep 50 lines of command line history
set history=50
" Tabs always turn into spaces
set tabstop=2 shiftwidth=2 expandtab

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

set rtp+=~/.vim/bundle/Vundle.vim

" Add NERDTree
autocmd VimEnter * NERDTree
" Set cursor to file if argument present
autocmd VimEnter * if argc() | wincmd p | endif

function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
" Strip trailing whitespaces after save file
autocmd BufWritePre * call <SID>StripTrailingWhitespaces()
