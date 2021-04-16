" settings
set number
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set list
set listchars=tab:▸\ ,eol:¬
set colorcolumn=80

" plugins
filetype plugin on

" syntax highlighting
syntax enable
set background=dark

colorscheme industry

highlight CursorLine term=bold cterm=bold
highlight CursorLineNr term=bold cterm=bold

" clear screen when quitting
" au VimLeave * :!clear

" remove trailing whitespace on save
" https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
au BufWritePre * :%s/\s\+$//e

" commentary
au FileType vim setlocal commentstring=\"\ %s
