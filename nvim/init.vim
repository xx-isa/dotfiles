call plug#begin()
    Plug 'dracula/vim'
    Plug 'xiyaowong/transparent.nvim'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'catppuccin/vim', { 'as': 'catpuccin' }
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'easymotion/vim-easymotion'
    Plug '~/.fzf'
    Plug 'junegunn/fzf.vim'
call plug#end()

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set cc=100,120
set ignorecase
set mouse=v

colorscheme catppuccin_frappe

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'

nnoremap <C-n> :NERDTreeToggle <Enter>
nnoremap <C-f> :NERDTreeFocus <Enter>
