"if executable('clangd')
"    augroup lsp_clangd
"        autocmd!
"        autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'clangd',
"                    \ 'cmd': {server_info->['clangd']},
"                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                    \ })
"        
"        "Unable this if you want LSP auto completion -> install
"        "VimCompleteMe...
"        let b:vcm_tab_complete = \"omni" 
"        autocmd FileType c setlocal omnifunc=lsp#complete
"        autocmd FileType cpp setlocal omnifunc=lsp#complete
"        autocmd FileType objc setlocal omnifunc=lsp#complete
"        autocmd FileType objcpp setlocal omnifunc=lsp#complete
"    augroup end
"endif
"
"
" 2 lines to debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = 'vim-lsp.log'
" 
" Not working HIE language server, not sure why its now working but it isnt.
" if executable('hie')
"     augroup lsp_hie
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'hie',
"                     \ 'cmd': {server_info->['hie-wrapper']},
"                     \ 'whitelist': ['hs','haskell'],
"                     \ })
"         
"         let b:vcm_tab_complete = \"omni" 
"         autocmd FileType haskell setlocal omnifunc=lsp#complete
"     augroup end
" endif

