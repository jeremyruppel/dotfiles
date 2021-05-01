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

" theme
set background=dark
colorscheme noctu

highlight CursorLine term=bold cterm=bold
highlight CursorLineNr term=bold cterm=bold

highlight Normal ctermfg=NONE
highlight Pmenu ctermfg=LightBlue
highlight PmenuSel ctermfg=LightMagenta cterm=bold

" remove trailing whitespace on save
" https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
au BufWritePre * :%s/\s\+$//e

" lightline
set laststatus=2
set nomodeline
let g:lightline={}
let g:lightline.colorscheme='16color'

" coc
" use Tab/Shift+Tab to cycle through completions
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" confirm completion with Return
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
