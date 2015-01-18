" vim: set ft=vim:
set runtimepath+=~/.vim
"set runtimepath+=~/.vim/bundle/snipmate/after
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()
"call pathogen#helptags()

filetype off
" 此处规定Vundle的路径
set rtp+=~/.vim/bundle/vundle/
"runtime bundle/vundle/autoload/vundle.vim
"call vundle#rc('~/.vim/bundle/')
call vundle#begin()
Bundle 'gmarik/vundle'
Bundle 'vim-latex/vim-latex'
Bundle 'laoyang945/snipmate.vim'
Bundle 'mhinz/vim-startify'
Bundle 'powerline/powerline'
if has('unix')
Bundle 'Valloric/YouCompleteMe'
endif
Bundle 'VOom'
call vundle#end()

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
colorscheme desert

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set printencoding=utf-8

if has("win32")||has("win64")
		source $VIMRUNTIME/delmenu.vim
		source $VIMRUNTIME/menu.vim
		language message zh_CN.UTF-8
		set guifont=Courier_New:h14
		"set guifontwide=Microsoft_YaHei_Mono:h20
		"测试
endif

syntax on
au BufEnter *.txt setlocal ft=txt
set autoread
set autowrite
au BufLeave,FocusLost * call WhenILeave()

function WhenILeave()
	call feedkeys("\e")
	silent! wa
endfunction

"the 3 lines below are for special input methods
"set imactivatekey=C-space
"autocmd! InsertLeave * set imdisable
"autocmd! InsertEnter * set noimdisable
"
set number
set linebreak
set nospell
set clipboard=unnamed "The * register is the default register.
set wrap
set tabstop=2
set softtabstop=2
set laststatus=2
set shiftwidth=4
set backup " turn on backup
set writebackup " turn on write backup
set backupdir=~/Documents/backup
set encoding=utf-8
set go=none
set foldmethod=syntax
au BufRead,BufNewFile vimperator-*.tmp setlocal ft=html
noremap j gj
noremap k gk
nmap <space> <C-f>
nmap <S-space> <C-b>
nmap <down> <C-E>
nmap <up> <C-Y>
nmap ti <Esc>i<C-r>=strftime("%c")<CR><Esc><Esc>
nmap wl <c-w>l
nmap wk <c-w>k
nmap wj <c-w>j
nmap wh <c-w>h
nmap tl gt
nmap th gT
noremap <C-l> :nohlsearch<CR><C-l>
let mapleader=","
"for plugins
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
set undofile

let g:Tex_Flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
"au FileType tex :TTarget pdf
if has("win32")||has("win64")
	let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
	let g:Tex_ViewRule_pdf = 'SumatraPDF'
endif

if has("unix")
	let g:Tex_CompileRule_pdf = 'xelatex --synctex=-1 -interaction=nonstopmode $*'
	let g:Tex_ViewRule_pdf="Skim"
	set guifont=Monaco:h20
	set noimd
	let g:ycm_path_to_python_interpreter = '/usr/bin/python'
endif

let g:Tex_MultipleCompileFormats = 'pdf,dvi'
let generate_tags=1
let g:ctags_statusline=1
let Tlist_Use_Horiz_Window=0
let g:Tex_EchoBibFields = 0
