call plug#begin('~/.local/share/nvim/plugged')

" Tmux navigation seamless with vim.
Plug 'christoomey/vim-tmux-navigator'

" Project navigation
Plug 'scrooloose/nerdtree'

" Search with Ag
Plug 'rking/ag.vim'

" Open a file at a line like via vim filename.txt:53 
Plug 'bogado/file-line'

" Pretty status bar at the bottom.
Plug 'itchyny/lightline.vim'

" tmux.conf syntax
Plug 'tmux-plugins/vim-tmux'

" GBlame
" Plug 'godlygeek/csapprox.git' 

" Enables cs"' to change surrounding " to '
Plug 'tpope/vim-surround'

" Yank ring C-p after pasting to go back through various y/d ops.
Plug 'skwp/YankRing.vim'

",T file search
Plug 'ctrlpvim/ctrlp.vim'

" vim-ruby plugin. Beastly, but it gives you a lot of syntax and ctags power.
Plug 'vim-ruby/vim-ruby'

" lets you use rubocop
Plug 'ngmy/vim-rubocop'

" rspec syntax highlighting
Plug 'keith/rspec.vim'

" This plugin gives you Ctrl-S which takes you from your current ruby file to
" the corresponding spec file.

Plug 'skwp/vim-spec-finder'

" If you use gems-ctags, this integration with bundler will give you
" navigation to those gems via Ctrl-].  Also gives dynamic coloring in
" Gemfile.lock based in installed status of gem.

Plug 'tpope/vim-bundler'

" Gives you stuff like :R for related files in a rails project.
Plug 'tpope/vim-rails'

" Gives you similar functionality to vim-rails in other ruby projects.
Plug 'tpope/vim-rake'

" Used for refactoring ruby code somewhat safely. Matchit is a dependency.
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-scripts/matchit.zip'

" Gives ,gc to comment a block of code.
Plug 'tomtom/tcomment_vim'

" Makes CamelCaseExample three words when navigating by W, B, or E.
Plug 'vim-scripts/camelcasemotion'

" If you have a variable this_name_sucks three times in a function, highlight
" the word in visual mode, then press Ctrl-n three times in normal mode, then
" use c, s, i, anything to go into insert mode and it'll repeat your actions
" in all three spots!
Plug 'kristijanhusak/vim-multiple-cursors'

" Prints At Match N of N when searching with /,?,n,N, etc.
Plug 'vim-scripts/IndexedSearch'

" Beause I use :Gblame all the time.
Plug 'tpope/vim-fugitive'

" A ton of syntax checkers and syntax
Plug 'sheerun/vim-polyglot'
Plug 'jtratner/vim-flavored-markdown'
Plug 'scrooloose/syntastic'
Plug 'nelstrom/vim-markdown-preview'
Plug 'skwp/vim-html-escape'
Plug 'hashivim/vim-terraform'
Plug 'elixir-lang/vim-elixir'

"Dockerfile syntax
Plug 'ekalinin/Dockerfile.vim'

" Solarized color schemes.
Plug 'altercation/vim-colors-solarized'

" Tabular helps with pretty-aligning stuff like hashes.
Plug 'godlygeek/tabular'

Plug 'jlanzarotta/bufexplorer'

" Autoformatting
Plug 'sbdchd/neoformat'

"SPecial theme for gvim
Plug 'joshdick/onedark.vim'

Plug 'craigemery/vim-autotag'

call plug#end()
