" Plugins
call plug#begin()

" Session restore
Plug 'tpope/vim-obsession'

"startup
Plug 'mhinz/vim-startify'
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
" Nerdtree

" Read ~/.NERDTreeBookmarks file and takes its second column

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \]

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeHijackNetrw=1 " NERDTree to split mode
let NERDTreeQuitOnOpen=1

"Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" marks
Plug 'kshenoy/vim-signature'

" splitting line
Plug 'AndrewRadev/splitjoin.vim', { 'for': ['py', 'json', 'zsh', 'sh', 'rs'] }

" i3/sway syntax
Plug 'jamespeapen/sway-config.vim', { 'for': ['swayconfig'] }

" Status line
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'

" parens
Plug 'tpope/vim-surround'
Plug 'LunarWatcher/auto-pairs'
let g:AutoPairs = {'"': '"', '{': '}', '''': '''', '(': ')', '''''''': '''''''', '[': ']', '"""': '"""'}

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
autocmd FileType * let b:coc_additional_keywords = ["-"]

" map <CR> to select suggestion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
"
"" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
"
"" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

Plug 'honza/vim-snippets'

" R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
let R_rconsole_height=4
let R_rconsole_width=67
let R_objbr_w=35
let R_assign = 2 " underscrore to '<-': on 2
let R_debug_center = 1
let g:rmd_fenced_languages = ['r', 'python', 'bash=sh', 'sh', 'awk', 'sed']
let R_openhtml = 0 " don't open html in default browser on knit
let R_openpdf = 0 " don't open html in default browser on knit
let r_indent_align_args = 0 " Set vim-r-plugin to mimics ess :
let r_indent_ess_comments = 0
let r_indent_ess_compatible = 0
let R_rmdchunk = 1

" Markdown
Plug 'vim-pandoc/vim-pandoc', {'for': ['md', 'rmd', 'quarto']}
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#keyboard#use_default_mappings = 0
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['md', 'rmd', 'quarto']}
Plug 'quarto-dev/quarto-vim', {'for': ['quarto']}

" Bullets.vim
Plug 'dkarter/bullets.vim', {'for': ['markdown', 'rmd']}
let g:bullets_line_spacing = 2
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'rmd',
    \ 'gitcommit',
    \]

" Latex
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}
let g:tex_flavor = "latex"

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" smart search highlighting 
Plug 'romainl/vim-cool'

" color schemes
Plug 'rktjmp/lush.nvim'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color', {'for': ['css', 'rmd']}
Plug 'preservim/vim-colors-pencil'

" Writing mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" Devicons
Plug 'ryanoasis/vim-devicons'

" Indents
Plug 'Yggdroot/indentLine'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) }, 'on': [] }
call plug#end()

