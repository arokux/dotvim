set nocompatible

" Initialize vundle
filetype on
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Load plugins
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'fugitive.vim'
Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'majutsushi/tagbar'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'SirVer/ultisnips'
Bundle 'xuhdev/SingleCompile'

" Settings

filetype plugin indent on

" reload .vimrc on each write
autocmd! bufwritepost .vimrc source %

set expandtab
set shiftwidth=4
set tabstop=4

set number
set showcmd
set hlsearch
set incsearch
syntax on

set mouse=a " enable mouse
set mousehide " hide mouse while typing
set clipboard+=autoselect " mouse selection to clipboard

"scriptencoding utf-8

"set autowrite " write to file on leave if modified
"set shortmess+=filmnrxoOtT
set history=1000
set spell

set backup
if has('persistent_undo')
    set undofile "so is persistent undo ...
    set undolevels=1000 "maximum number of changes that can be undone
    set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif


let mapleader = ","

"Color scheeme
set background=dark
set t_Co=256
let g:solarized_termcolors=256
colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

let g:EasyMotion_leader_key = '<Leader>'

"IndentGuidesEnable
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"hi IndentGuidesOdd  ctermbg=white
"hi IndentGuidesEven ctermbg=lightgrey

set shortmess+=filmnrxoOtT

map  <silent> <F12>   :NERDTreeToggle<CR>
map  <silent> <C-F12> :NERDTreeFind<CR>
map  <silent> <A-F12> :FufFile<CR>


function! RunC()
   if filereadable("Makefile")
       silent make 
       redraw!
       if len(getqflist()) == 1
         "if no error do nothing
       else
         for i in getqflist()
           if i['valid']
                cwin
                winc p
                return
           endif
         endfor
        endif
   else
       :SCCompileRunAF -Wall -Werror -std=c99<CR>
   endif
endfunction
"map  <silent> <F9>    :SCCompileAF -Wall -Werror -std=c99<CR>
map  <F10> :call RunC()<CR>
let g:SingleCompile_showquickfixifwarning = 1
let g:SingleCompile_showquickfixiferror = 1
let g:SingleCompile_showresultafterrun = 1
