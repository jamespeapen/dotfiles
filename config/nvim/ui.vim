" Colors
set termguicolors     " enable true colors support
let &t_ut=''

colorscheme gruvbox
set background=dark

function! Light()
    :set background=light
    :hi Normal guibg=#ebdbb2
endfunction

nnoremap <Leader>l :call Light()<CR>

au ColorScheme * hi Normal ctermbg=none guibg=none

" Indent line
let g:indentLine_setColors = 0
