" <F2> will now remove any search highlighting.
nnoremap <F2> :noh<cr>

" Make <C-h/j/k/l> jump windows like you was tmuxin.
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

nnoremap <C-h> <C-\><C-n><C-w>h
nnoremap <C-j> <C-\><C-n><C-w>j
nnoremap <C-k> <C-\><C-n><C-w>k
nnoremap <C-l> <C-\><C-n><C-w>l

" Make <C-w> work correctly form the terminal.
tnoremap <C-w> <C-\><C-n><C-w>

" Allows holding CTRL and double tapping backslash in terminal buffers
" to get back to normal mode instead of all that \ then n nonsense.
tnoremap <C-\><C-\> <C-\><C-N>

tnoremap <M-a> <c-\><c-n>:Buffers!<cr>
