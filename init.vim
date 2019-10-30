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

noremap <c-up>  ddkkp
noremap <c-down> :move +1 <ENTER>

call plug#begin('~/.vim.plugged')

Plug 'scrooloose/nerdtree'
Plug 'Shougo/denite.nvim' " navigation of files
Plug 'drewtempelmeyer/palenight.vim' " colorscheme
Plug 'itchyny/lightline.vim' " lighting bar
Plug 'airblade/vim-gitgutter' " git stuff 
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive', { 'branch' : 'release'} " git stuff in lighting bar
Plug 'sheerun/vim-polyglot' " syntax highlighting
Plug 'neoclide/coc.nvim', { 'branch' : 'release'} " autocompletion
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'markwoodhall/vim-nuget'
Plug 'vhdirk/vim-cmake'

call plug#end()

" Palenight configuration
set background=dark
colorscheme palenight

"lightLine configuration
if !has('gui_running')
   set t_Co=256
endif

" Configure fuzzy finder
map ; :Files<CR>

" CTRL-X and SHIFT-Del are Cut
" vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
" vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
" map <C-V>		"+gP
map <S-Insert>		"+gP

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

source ~/AppData/Local/nvim/ale.vim
source ~/AppData/Local/nvim/coc.vim
source ~/AppData/Local/nvim/omnisharp.vim
