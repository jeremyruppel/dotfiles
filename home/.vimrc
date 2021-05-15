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

highlight Keyword ctermfg=7 cterm=bold
highlight CocErrorFloat ctermfg=5

highlight Boolean ctermfg=5
highlight String ctermfg=10
highlight Todo ctermfg=13
highlight Pmenu ctermfg=2
highlight PmenuSel ctermfg=13
highlight Function ctermfg=10
highlight Number ctermfg=13

" typescript
highlight typescriptBraces ctermfg=11
highlight typescriptFuncName ctermfg=12
highlight typescriptArrowFunc ctermfg=Yellow
highlight typescriptGlobal ctermfg=3
highlight typescriptTypeReference ctermfg=11
highlight typescriptCall ctermfg=15
highlight typescriptPredefinedType ctermfg=3
highlight typescriptIdentifier ctermfg=LightCyan
highlight typescriptNodeGlobal ctermfg=12
highlight typescriptAccessibilityModifier ctermfg=13 cterm=bold
highlight typescriptClassName cterm=bold

" vim
highlight vimGroup ctermfg=6
highlight vimHiGroup ctermfg=7

" print out all of the highlight groups under the cursor
function! SynGroup()
  let l:s = synID(line('.'), col('.'), 1)
  echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

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

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" fzf
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
set rtp+=/usr/local/opt/fzf
set rtp+=/opt/homebrew/opt/fzf

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
