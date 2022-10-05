" Colors
set termguicolors     " enable true colors support
let &t_ut=''

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

lua <<EOF
require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  overrides = {},
})
vim.cmd("colorscheme gruvbox")
EOF
