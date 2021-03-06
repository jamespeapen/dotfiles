" show commands
set showcmd

" linebreak at spaces
set linebreak

set colorcolumn=80
au BufEnter *.md set textwidth=80

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

" python
let g:python3_host_prog="/usr/local/bin/python3"

" fzf settings
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

" autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p

" NERDTree to split model
let NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen=1

" set working directory to buffer directory
autocmd BufEnter * if &buftype !=# 'terminal' | lcd %:p:h

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'index': 'SUMMARY',
                       \ 'syntax': 'markdown', 'ext': '.md',
                       \ 'links_space_char': '_'}]
let g:vimwiki_global_ext=0
let g:vimwiki_table_mappings = 0

" Markdown
let g:markdown_fenced_languages = ['r', 'python', 'sh', 'bash=sh', 'rust', 'vim', 'awk', 'sed', 'tex', 'applescript']

" R setup
let R_rconsole_height=4
let R_objbr_w=35
let g:rmd_fenced_languages = ['r', 'python', 'bash=sh', 'sh', 'awk', 'sed']
let R_save_win_pos=1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Coc
autocmd FileType * let b:coc_additional_keywords = ["-"]
