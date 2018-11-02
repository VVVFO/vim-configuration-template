set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'

" TODO Declare your plugins below here like these:
Plugin 'plasticboy/vim-markdown'
Plugin 'rhysd/vim-color-spring-night'

call vundle#end()

" TODO Write your configurations here, like these:
syntax on
inoremap jk <Esc>
nnoremap ; :
set termguicolors
color spring-night

