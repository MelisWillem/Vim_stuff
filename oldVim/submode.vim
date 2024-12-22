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


