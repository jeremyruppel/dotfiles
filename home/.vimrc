" line numbers
set number
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab

" invisibles
set list
set listchars=tab:▸\ ,eol:¬

" plugins
filetype plugin on

" syntax highlighting
syntax enable
set background=dark
" colorscheme pulumi
colorscheme pablo
highlight CursorLine term=bold cterm=bold guibg=Grey40
highlight CursorLineNr term=bold cterm=bold guibg=Grey40

" clear screen when quitting
" au VimLeave * :!clear

" remove trailing whitespace on save
" https://howchoo.com/vim/vim-how-to-remove-trailing-whitespace-on-save
au BufWritePre * :%s/\s\+$//e

" commentary
au FileType vim setlocal commentstring=\"\ %s
