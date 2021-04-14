" line numbers
set number
set cursorline

" invisibles
set list
set listchars=tab:▸\ ,eol:¬


" syntax highlighting
syntax enable
set background=dark
colorscheme pulumi
highlight CursorLine term=bold cterm=bold guibg=Grey40
highlight CursorLineNr term=bold cterm=bold guibg=Grey40

" clear screen when quitting
" au VimLeave * :!clear

" commentary filetypes
au FileType zsh setlocal commentstring=#\ %s
au FileType vim setlocal commentstring=\"\ %s

