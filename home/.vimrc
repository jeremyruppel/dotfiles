" line numbers
set number
set cursorline
" set tabstop=4
" set shiftwidth=4
" set expandtab

" invisibles
set list
set listchars=tab:▸\ ,eol:¬


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

" commentary filetypes
au FileType zsh setlocal commentstring=#\ %s
au FileType rc setlocal commentstring=#\ %s
au FileType vim setlocal commentstring=\"\ %s
au FileType make setlocal commentstring=#\ %s
