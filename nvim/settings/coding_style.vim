" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

if exists('+colorcolumn')
  set colorcolumn=80
else
  autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Remap of <Space> in normal.
" If on a fold line, open it. 
" If at the beginning of a fold, close it.
" If none of the above, move right like normal.
" But only in JSON files.
autocmd BufNewFile,BufRead *.json nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
