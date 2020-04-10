let g:deoplete#sources#jedi#statement_length =50
let g:deoplete#sources#jedi#enable_typeinfo = 1
" let g:deoplete#sources#jedi#show_docstring: =0

" Set the Python interpreter path to use for the completion server. It defaults to "python", i.e. the first available python in $PATH. Note: This is different from Neovim's Python (:python) in general.
" let g:deoplete#sources#jedi#python_path= 

if has ("win32")
    let g:python_host_prog = 'C:\Users\zille\AppData\Local\Continuum\anaconda3\python.exe'
    let g:python3_host_prog = 'C:\Users\zille\AppData\Local\Continuum\anaconda3\python.exe'
else
    let g:python_host_prog = '/usr/bin/python'
    let g:python3_host_prog = '/usr/bin/python3'
endif
