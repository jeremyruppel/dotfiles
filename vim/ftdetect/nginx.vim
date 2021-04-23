" the official nginx docker image can template configs into conf.d
" and expects them to have the extension .template by default
au BufRead,BufNewFile */nginx/*.conf.template set ft=nginx
