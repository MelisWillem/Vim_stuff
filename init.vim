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

"stuff required when using nvim-qt
if exists('g:GuiLoaded')
    " call GuiWindowMaximized(1)
    GuiTabline 0
    GuiPopupmenu 0
    GuiLinespace 2
    GuiFont! Hack:h10:l
endif


syntax on


call plug#begin('~/.vim.plugged')
"Plug 'ervandew/supertab' " supertab seems super broken

"Classic way of doing auto completion, using clang toolchain
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim/'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'deoplete-plugins/deoplete-jedi'
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

Plug 'editorconfig/editorconfig-vim'
Plug 'markwoodhall/vim-nuget'
Plug 'vhdirk/vim-cmake'
Plug 'Chiel92/vim-autoformat'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': {-> mkdp#util#install()}}
Plug 'https://github.com/soramugi/auto-ctags.vim'

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

" language server need to install some bin's that differ
" on windows vs linux
if has("win32") || has ("win16")
    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'powershell install.ps1',
                \ }
else
    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch' : 'next',
                \ 'do' : 'bash install.sh',
                \}
end

Plug 'whonore/Coqtail' | Plug 'let-def/vimbufsync'

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
call deoplete#custom#option('profile', v:true)
call deoplete#custom#option('max_list', 15)

"automatic autoformat on buffer save
"au BufWrite * :Autoformat

" There must be a cleaner way to do this ..
if has("win32") || has ("win16")
    let vimStuffLocation = "~/AppData/Local/nvim/Vim_stuff/"
else
    let vimStuffLocation =  "~/.config/nvim/Vim_stuff/"
end
exec 'source' vimStuffLocation.'neoterm.vim'
exec 'source' vimStuffLocation.'deoplete-jedi.vim'
exec 'source' vimStuffLocation.'denite.vim'
exec 'source' vimStuffLocation.'langserver.vim'
exec 'source' vimStuffLocation.'hotkeysGeneral.vim'
