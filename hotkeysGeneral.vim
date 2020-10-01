set completeopt-=preview

" Move line up and down
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
" inoremap <leader>j <Esc>:m .+1<CR>==gi
" inoremap <leader>k <Esc>:m .-2<CR>==gi
" vnoremap <leader>j :m '>+1<CR>gv=gv
" vnoremap <leader>k :m '<-2<CR>gv=gv

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

nnoremap f<C-j> :make <CR>
nnoremap <C-j> :cn <CR>
nnoremap <C-k> :cp <CR>
nnoremap gd <C-]> <CR>

" Revert tab and shift tab, not sure why this is needed.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" ## start of stuff related to resizing windows with repeated key's ##
" should alway's happen after setting other hotkey's
"
" https://ddrscott.github.io/blog/2016/making-a-window-submode/
"
" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1

call submode#enter_with('window', 'n', '', '<leader>w')
call submode#leave_with('window', 'n', '', '<ESC>')

" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
\           'n','o','p','q','r','s','t','u','v','w','x','y','z']
  " maps lowercase, uppercase and <C-key>
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor

" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor

" <lowercase-pipe> sets the width to 80 columns, pipe (<S-\>) by default
" maximizes the width.
call submode#map('window', 'n', '', '\', ':vertical resize 80<CR>')

" Resize faster
call submode#map('window', 'n', '', '+', '3<C-w>+')
call submode#map('window', 'n', '', '-', '3<C-w>-')
call submode#map('window', 'n', '', '<', '10<C-w><')
call submode#map('window', 'n', '', '>', '10<C-w>>')
