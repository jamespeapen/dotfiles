" Colors
set termguicolors     " enable true colors support
let &t_ut=''

colorscheme gruvbox
set background=dark

au ColorScheme * hi Normal ctermbg=none guibg=none

" Indent line
let g:indentLine_setColors = 0
