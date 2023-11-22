" Plugins
call plug#begin()

"-------------------- Opening 

" Session restore
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }

"startup
Plug 'mhinz/vim-startify'
"<<<
let g:startify_session_persistence = 1
let g:startify_session_autoload = 1
">>>

" Nerdtree
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
" <<<
" Read ~/.NERDTreeBookmarks file and takes its second column
let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \]
let NERDTreeHijackNetrw=1 " NERDTree to split mode
let NERDTreeQuitOnOpen=1
" >>>

" Undotree
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
" <<<
nnoremap <F5> :UndotreeToggle<CR>
" >>>

"-------------------- Utils 
" lua functions
Plug 'nvim-lua/plenary.nvim'

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'


" fzf for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" bibtex
Plug 'nvim-telescope/telescope-bibtex.nvim', { 'for': [ 'rmd', 'quarto' ]}

" smart search highlighting 
Plug 'romainl/vim-cool'

"Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" marks
Plug 'kshenoy/vim-signature'

" splitting line
Plug 'AndrewRadev/splitjoin.vim', { 'for': ['python', 'javascript', 'json', 'zsh', 'r', 'rs', 'lua'] }
" <<<
let g:splitjoin_python_brackets_on_separate_lines = 1
" >>>

" parens
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'

" Commenting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tpope/vim-commentary'
" <<<
vmap <C-/> gc
imap <C-/> <Esc>VgcA
nmap <C-/> Vgc
" >>>

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Snippets
Plug 'SirVer/ultisnips'
" <<<
let g:UltiSnipsExpandTrigger="<C-I>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" >>>

Plug 'jamespeapen/vim-snippets'

" REPL
Plug 'axvr/zepl.vim', { 'for': [ 'julia', 'python'] }
" <<<
let maplocalleader = "\\"
nmap <LocalLeader>l gzz
nmap <LocalLeader>p gzip
let g:repl_config = {
            \   'julia': {
            \     'cmd': 'julia',
            \     'load_files': 'include("%s")'
            \   }
            \ }
" >>>

"-------------------- LSP
Plug 'neovim/nvim-lspconfig'

" Auto-completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp' " nvim LSP source
Plug 'hrsh7th/cmp-buffer'   " buffer source
Plug 'hrsh7th/cmp-path'     " filesystem path source
Plug 'hrsh7th/cmp-cmdline'  " vim commandline source
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'quangnguyen30192/cmp-nvim-ultisnips' " Ultisnips source

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/playground'

"-------------------- LANGUAGE PLUGINS 

" R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
" <<<
let R_buffer_opts = "nobuflisted"
let R_rconsole_height=20
let R_rconsole_width=67
let R_objbr_w=35
let R_nvimpager = "horizontal"
let R_assign = 2 " underscrore to '<-': on 2
let R_debug_center = 1
let g:rmd_fenced_languages = ['r', 'python', 'bash=sh', 'sh', 'awk', 'sed', 'cpp']
let R_openhtml = 0 " don't open html in default browser on knit
let R_openpdf = 1 " don't open html in default browser on knit
let r_indent_ess_comments = 0
let R_rmdchunk = '``'
" >>>

" Markdown
Plug 'vim-pandoc/vim-pandoc' ", { 'for': [ 'markdown', 'rmd', 'quarto']}
" <<<
let g:pandoc#formatting#mode = 'h'
let g:pandoc#folding#level = 2
let g:pandoc#keyboard#use_default_mappings = 0
" >>>
Plug 'vim-pandoc/vim-pandoc-syntax' ", { 'for': [ 'markdown', 'rmd', 'quarto']}
Plug 'quarto-dev/quarto-vim', {'for': ['quarto']}

" Latex
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}
" <<<
let g:tex_flavor = "latex"
" >>>

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
" <<<
let g:rustfmt_autosave = 1
Plug 'simrat39/rust-tools.nvim', {'for': 'rust'}
" >>>

" Julia
Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}
Plug 'kdheepak/JuliaFormatter.vim', {'for': 'julia'}

" Python
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" i3/sway syntax
Plug 'jamespeapen/sway-config.vim', { 'for': ['swayconfig'], 'branch': 'dev' }

"-------------------- UI 

" color schemes
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'ap/vim-css-color', {'for': ['css', 'rmd']}

" Status line
Plug 'itchyny/lightline.vim'

" Writing mode
Plug 'junegunn/goyo.vim', { 'on': 'Goyo'}
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" Devicons
Plug 'nvim-tree/nvim-web-devicons'

" Indents
Plug 'Yggdroot/indentLine'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) }, 'on': [] }
" Bullets.vim
Plug 'dkarter/bullets.vim', {'for': ['markdown', 'rmd']}
" <<<
let g:bullets_line_spacing = 2
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'rmd',
    \ 'gitcommit',
    \]
" >>>

call plug#end()

lua <<EOF
require('gitsigns').setup()
EOF

" vim:foldmethod=marker:fmr=<<<,>>>
