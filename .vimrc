" vim: set ft=vim:
set runtimepath+=~/.vim
set nocompatible
source $VIMRUNTIME/vimrc_example.vim


filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'vim-latex/vim-latex'
Plugin 'laoyang945/snipmate.vim'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/Conque-Shell'
Plugin 'vim-scripts/utl.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-voom/VOom'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'yegappan/grep'
Plugin 'luochen1990/rainbow'
Plugin 'vim-scripts/rainbow_csv.vim'
Plugin 'godlygeek/tabular'

if has("win32")||has("win64")
		Plugin	'file://~/.vim/bundle/YouCompleteMe',{'pinned':1}
endif
if has('unix')
		Plugin 'Valloric/YouCompleteMe'
endif
call vundle#end()

set runtimepath+=~/.vim/bundle/snipmate.vim/after
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
set autochdir
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
set lines=999 columns=999
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
nmap ti "=strftime("%c")<CR>P
nmap wl <c-w>l
nmap wk <c-w>k
nmap wj <c-w>j
nmap wh <c-w>h
nmap tl gt
nmap th gT
noremap <C-l> :nohlsearch<CR><C-l>
nmap <F2> :Startify<CR>
nmap <F3> :NERDTreeToggle<CR>
nmap <F4> :let @+=expand("%")<CR>
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
let g:ycm_confirm_extra_conf = 0
let g:rainbow_active=1
set completeopt-=preview  
"let g:ycm_key_invoke_completion = '<C-;>'
let g:ycm_key_list_select_completion = ['<C-n>','<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>','<Up>']
