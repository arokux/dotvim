 set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'
 Bundle 'c.vim'
 Bundle 'fugitive.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 

 filetype plugin indent on
