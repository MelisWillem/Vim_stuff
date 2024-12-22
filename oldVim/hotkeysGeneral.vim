set completeopt-=preview

" close buffer 
nnoremap <C-q> :q<ENTER> 
nnoremap <C-Q> :q!<ENTER> 

" CTRL-C and CTRL-Insert are Copy
" vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

"TODO create to a command to convert from 16 -> 8 utf
":set bomb
":set fileencoding=utf-8

noremap <C-S> :w<ENTER>
nnoremap <C-*> :noh

nnoremap f<C-j> :make <CR>
nnoremap <C-j> :cn <CR>
nnoremap <C-k> :cp <CR>
nnoremap gd <C-]> <CR>

" Revert tab and shift tab, not sure why this is needed.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" SLIME-VIM
nnoremap <leader>g SlimeSend<CR>
