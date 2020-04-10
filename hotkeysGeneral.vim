" Move line up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" close buffer 
nnoremap <C-q> :q<ENTER> 
nnoremap <C-Q> :q!<ENTER> 

" Configure fuzzy finder
map <C-;> :Files<CR>

" CTRL-X and SHIFT-Del are Cut
" vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
" vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
" map <C-V>		"+gP
map <S-Insert>		"+gP

map <S-Insert>		"+gP

"TODO create to a command to convert from 16 -> 8 utf
":set bomb
":set fileencoding=utf-8

noremap <C-S> :w<ENTER>
nnoremap <C-*> :noh
