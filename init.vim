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

" autocomplete-> used by lsp 
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim' " colorscheme
Plug 'itchyny/lightline.vim' " lighting bar
Plug 'airblade/vim-gitgutter' " git stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive', { 'branch' : 'release'} " git stuff in lighting bar

Plug 'editorconfig/editorconfig-vim'
Plug 'markwoodhall/vim-nuget'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': {-> mkdp#util#install()}}
Plug 'neovim/nvim-lspconfig'

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

" There must be a cleaner way to do this ..
if has("win32") || has ("win16")
    let vimStuffLocation = "~/AppData/Local/nvim/Vim_stuff/"
else
    let vimStuffLocation =  "~/.config/nvim/Vim_stuff/"
end

exec 'source' vimStuffLocation.'hotkeysGeneral.vim'
exec 'source' vimStuffLocation.'langserver.vim'

let g:python3_host_prog = 'C:\Users\zille\anaconda3\envs\HML\python.exe'
" These should go into a seperate file:

" Find files using Telescope command-line sugar.
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
