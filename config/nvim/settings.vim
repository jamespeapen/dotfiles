" show commands
set showcmd

" linebreak at spaces
set linebreak

set colorcolumn=80
au BufEnter *.md,*.rmd,*.tex set textwidth=80

" set split on right and below
set splitright
set splitbelow

" indent
set smartindent
set autoindent
let g:indentLine_concealcursor=""
let g:indentLine_conceallevel=2

"tabstop
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" clipboard
set clipboard=unnamed

" set line number with absolute number for current line
set number
set relativenumber
set cursorline

" syntax highlighting
syntax on

" search
set incsearch
set hlsearch
set inccommand=nosplit

" undo
set undofile

" python
let g:python3_host_prog="/usr/local/bin/python3"

" set working directory to buffer directory unless terminal buffer
autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h

" autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" set working directory to buffer directory unless terminal buffer
autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h


" Markdown
let g:markdown_fenced_languages = ['r', 'python', 'sh', 'bash=sh', 'rust', 'vim', 'awk', 'sed', 'tex']

