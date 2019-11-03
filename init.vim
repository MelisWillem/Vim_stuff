" ---- use the windows shortkeys like crtl-v and ctrl-c with the mouse
" source $VIMRUNTIME/mswin.vim
set mouse=a
" ---- enable line numbers
set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

syntax on

call plug#begin('~/.vim.plugged')

"Classic way of doing auto completion, using clang toolchain
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim/'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'Shougo/denite.nvim' " navigation of files

Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim' " colorscheme
Plug 'itchyny/lightline.vim' " lighting bar
Plug 'airblade/vim-gitgutter' " git stuff 
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive', { 'branch' : 'release'} " git stuff in lighting bar
Plug 'rbong/vim-flog'  " git tree in vim --> do we really need this? doesnt seem like something an editor needs
Plug 'sheerun/vim-polyglot' " syntax highlighting

Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
Plug 'markwoodhall/vim-nuget'
Plug 'vhdirk/vim-cmake'

Plug 'neovimhaskell/haskell-vim' " Nice haskell highlighting
Plug 'alx741/vim-hindent' " Haskell automatic indent
" Plug 'parsonsmatt/intero-neovim' " very weird doesn seem to work at all,
" also it breaks the syntax highlighting

Plug 'kassio/neoterm' " This has questional performace need to look into it
"Plug 'tjdevries/nvim-langserver-shim' " seems like quiet the hassle maybe try
"again later...

" These 3 work nicely together to get the a simple LSP to work
" At the moment " 
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'ajh17/vimcompletesme'
" ------------------------------- 

call plug#end()

" Palenight configuration
set background=dark
colorscheme palenight

"lightLine configuration
if !has('gui_running')
   set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_profile = 1
"call deoplete#custom#var('clangx', 'clang', 'C:\msys64\mingw64\bin\clang.exe')
call deoplete#custom#option('profile', v:true)
call deoplete#enable_logging('DEBUG', 'deoplete.log')
"call deoplete#custom#source('clangx', 'is_debug_enabled', 1)
"-call deoplete#custom#option('auto_complete', v:true)
"-call deoplete#custom#option('max_list', 500)


source ~/AppData/Local/nvim/hotkeysGeneral.vim
source ~/AppData/Local/nvim/neoterm.vim
"-source ~/AppData/Local/nvim/langserver.vim
" source ~/AppData/Local/nvim/denite.vim

"source ~/AppData/Local/nvim/ale.vim
"source ~/AppData/Local/nvim/iicoc.vim
"source ~/AppData/Local/nvim/omnisharp.vim
"source ~/AppData/Local/nvim/haskell.vim
