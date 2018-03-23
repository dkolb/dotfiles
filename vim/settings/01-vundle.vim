set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Tmux navigation seamless with vim.
Plugin 'christoomey/vim-tmux-navigator'

" Project navigation
Plugin 'scrooloose/nerdtree.git'

" Search with Ag
Plugin 'rking/ag.vim'

" Open a file at a line like via vim filename.txt:53 
Plugin 'bogado/file-line.git'

" Pretty status bar at the bottom.
Plugin 'itchyny/lightline.vim'

" tmux.conf syntax
Plugin 'tmux-plugins/vim-tmux.git'

" GBlame
" Plugin 'godlygeek/csapprox.git' 

" Enables cs"' to change surrounding " to '
Plugin 'tpope/vim-surround.git'

" Yank ring C-p after pasting to go back through various y/d ops.
Plugin 'skwp/YankRing.vim'

",T file search
Plugin 'ctrlpvim/ctrlp.vim.git'

" vim-ruby plugin. Beastly, but it gives you a lot of syntax and ctags power.
Plugin 'vim-ruby/vim-ruby'

" lets you use rubocop
Plugin 'ngmy/vim-rubocop'

" rspec syntax highlighting
Plugin 'keith/rspec.vim'

" This plugin gives you Ctrl-S which takes you from your current ruby file to
" the corresponding spec file.

Plugin 'skwp/vim-spec-finder'

" If you use gems-ctags, this integration with bundler will give you
" navigation to those gems via Ctrl-].  Also gives dynamic coloring in
" Gemfile.lock based in installed status of gem.

Plugin 'tpope/vim-bundler'

" Gives you stuff like :R for related files in a rails project.
Plugin 'tpope/vim-rails'

" Gives you similar functionality to vim-rails in other ruby projects.
Plugin 'tpope/vim-rake'

" Used for refactoring ruby code somewhat safely. Matchit is a dependency.
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'vim-scripts/matchit.zip'

" Gives ,gc to comment a block of code.
Plugin 'tomtom/tcomment_vim.git'

" Makes CamelCaseExample three words when navigating by W, B, or E.
Plugin 'vim-scripts/camelcasemotion'

" If you have a variable this_name_sucks three times in a function, highlight
" the word in visual mode, then press Ctrl-n three times in normal mode, then
" use c, s, i, anything to go into insert mode and it'll repeat your actions
" in all three spots!
Plugin 'kristijanhusak/vim-multiple-cursors'

" Prints At Match N of N when searching with /,?,n,N, etc.
Plugin 'vim-scripts/IndexedSearch'

" Beause I use :Gblame all the time.
Plugin 'tpope/vim-fugitive'

" A ton of syntax checkers and syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'jtratner/vim-flavored-markdown.git'
Plugin 'scrooloose/syntastic.git'
Plugin 'nelstrom/vim-markdown-preview'
Plugin 'skwp/vim-html-escape'
Plugin 'hashivim/vim-terraform'
Plugin 'elixir-lang/vim-elixir'

"Dockerfile syntax
Plugin 'ekalinin/Dockerfile.vim'

" Solarized color schemes.
Plugin 'altercation/vim-colors-solarized'

" Tabular helps with pretty-aligning stuff like hashes.
Plugin 'godlygeek/tabular.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
