" settings
set number
set cursorline
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set list
set listchars=tab:▸\ ,eol:¬
set colorcolumn=80

" plugins
filetype plugin indent on

" syntax highlighting
syntax enable
" use newer regex engine to speed up slow syntax highlighting
" https://jameschambers.co.uk/vim-typescript-slow
set re=0

set background=dark
colorscheme industry

highlight CursorLine term=bold cterm=bold
highlight CursorLineNr term=bold cterm=bold

" remove trailing whitespace on save
" https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
au BufWritePre * :%s/\s\+$//e

" commentary
au FileType vim setlocal commentstring=\"\ %s
