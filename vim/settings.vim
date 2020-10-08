" show commands
set showcmd

" linebreak at spaces
set linebreak

"tabstop
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" clipboard
set clipboard=unnamed

" set line number with absolute number for current line
set relativenumber
set number

" syntax highlighting
syntax on

" search
set incsearch
set hlsearch

" fzf settings
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

" autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" NERDTree to split model
let NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen=1

" set working directory to buffer directory
autocmd BufEnter * lcd %:p:h

" R setup
let R_rconsole_height=4
let R_objbr_w=35
let g:rmd_fenced_languages = ['r', 'python']
let g:markdown_fenced_languages = ['r', 'python']
let R_save_win_pos=1

" wayland clipboard support
xnoremap "+y y:call system("wl-copy", @")<cr>

nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
