" Colors
set termguicolors     " enable true colors support
let &t_ut=''

let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

function! Light()
    :set background=light
    au ColorScheme * hi Normal ctermbg=white guibg=#eeeeee
    hi Normal ctermbg=white guibg=#eeeeee
    :colo pencil
endfunction

nnoremap <Leader>l :call Light()<CR>

au ColorScheme * hi Normal ctermbg=none guibg=none

" Indent line
let g:indentLine_setColors = 0
