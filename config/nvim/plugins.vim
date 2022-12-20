" Plugins

" Install vim-plug
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"-------------------- Opening 

" Session restore
Plug 'tpope/vim-obsession', { 'on': 'Obsession' }

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

"-------------------- Utils 
" lua functions
Plug 'nvim-lua/plenary.nvim'

" Fuzzy finder
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-file-browser.nvim'


" fzf for telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" bibtex
Plug 'nvim-telescope/telescope-bibtex.nvim', { 'for': 'rmd' }

" smart search highlighting 
Plug 'romainl/vim-cool'

"Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" marks
Plug 'kshenoy/vim-signature'

" splitting line
Plug 'AndrewRadev/splitjoin.vim', { 'for': ['python', 'json', 'zsh', 'r', 'rs', 'lua'] }
let g:splitjoin_python_brackets_on_separate_lines = 1

" parens
Plug 'tpope/vim-surround'
Plug 'LunarWatcher/auto-pairs'
let g:AutoPairs = {'"': '"', '{': '}', '''': '''', '(': ')', '''''''': '''''''', '[': ']', '"""': '"""'}
let g:AutoPairsCompatibleMaps = 0
let g:AutoPairsMapBS = 1
let g:AutoPairsShortcutToggle = ""
let g:AutoPairsShortcutFastWrap = ""
let g:AutoPairsShortcutJump = ""
let g:AutoPairsShortcutBackInsert = ""
let g:AutoPairsMoveExpression = ""
let g:AutoPairsShortcutIgnore = ""
let g:AutoPairsShortcutToggleMultilineClose = ""

" Commenting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'tpope/vim-commentary'
vmap <C-/> gc
imap <C-/> <Esc>VgcA
nmap <C-/> Vgc

" Git
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<C-I>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

Plug 'honza/vim-snippets'

" REPL
let maplocalleader = "\\"
nmap <LocalLeader>l gzz
nmap <LocalLeader>p gzip
Plug 'axvr/zepl.vim', { 'for': [ 'julia', 'python'] }
let g:repl_config = {
            \   'julia': {
            \     'cmd': 'julia',
            \     'load_files': 'include("%s")'
            \   }
            \ }

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

"-------------------- LANGUAGE PLUGINS 

" R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }
let R_rconsole_height=20
let R_rconsole_width=67
let R_objbr_w=35
let R_assign = 2 " underscrore to '<-': on 2
let R_debug_center = 1
let g:rmd_fenced_languages = ['r', 'python', 'bash=sh', 'sh', 'awk', 'sed', 'cpp']
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

" Latex
Plug 'lervag/vimtex', {'for': ['tex', 'plaintex']}
let g:tex_flavor = "latex"

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}
let g:rustfmt_autosave = 1
Plug 'simrat39/rust-tools.nvim', {'for': 'rust'}

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
Plug 'preservim/vim-colors-pencil'

" Status line
Plug 'itchyny/lightline.vim'

" Writing mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" Devicons
Plug 'ryanoasis/vim-devicons'

" Indents
Plug 'Yggdroot/indentLine'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Bullets.vim
Plug 'dkarter/bullets.vim', {'for': ['markdown', 'rmd']}
let g:bullets_line_spacing = 2
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'rmd',
    \ 'gitcommit',
    \]

call plug#end()
