set hidden

let g:LanguageClient_serverCommands = {
     \ 'haskell': ['hie-wrapper'] ,
     \ 'fsharp': ['dotnet', 'C:\Users\zille\LSP\fsharp-language-server-0.1.23\src\FSharpLanguageServer\bin\Release\netcoreapp2.0\FSharpLanguageServer.dll']
     \ }
"    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"    \ 'python': ['/usr/local/bin/pyls'],
"    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguaE:Client#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
