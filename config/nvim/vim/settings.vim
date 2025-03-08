" title
set title

" show commands
set showcmd

" linebreak at spaces
set linebreak

set colorcolumn=80
au BufEnter *.md,*.rmd,*.Rmd,*.tex,*.qmd set textwidth=80

" show trailing spaces
set list
set listchars=tab:\ \ ,trail:·

" set split on right and below
set splitright
set splitbelow

" indent
set smartindent
set autoindent

"tabstop
autocmd FileType lua set shiftwidth=2
autocmd FileType r set shiftwidth=2
autocmd FileType julia set shiftwidth=4
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

set spellfile=~/.config/nvim/spell/en.utf-8.add

" fold
set foldmethod=marker

" python
let g:python3_host_prog="nvim-python3"

" autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" set working directory to buffer directory
set autochdir

" Markdown
let g:markdown_fenced_languages = ['r', 'python', 'sh', 'bash=sh', 'rust', 'vim', 'awk', 'sed', 'tex']

" so vim fugitive is quicker to load (tpope/vim-fugitive#1492)
set shell=bash
