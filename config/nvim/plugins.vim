" Plugins
call plug#begin()

"startup
Plug 'mhinz/vim-startify'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

"Tagbar
Plug 'majutsushi/tagbar'

" Syntax highlighting
Plug 'vim-syntastic/syntastic'
let g:polyglot_disabled = ['md', 'markdown']
Plug 'sheerun/vim-polyglot'

" i3/sway syntax
Plug 'jamespeapen/sway-config.vim'

" Status line
Plug 'itchyny/lightline.vim'

" Git
Plug 'tpope/vim-fugitive'

" parens
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rmd'] }

" VimWiki
Plug 'vimwiki/vimwiki'

" Markdown
Plug 'vim-pandoc/vim-pandoc', {'for': ['md', 'rmd']}
let g:pandoc#modules#disabled = ['folding']
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#keyboard#use_default_mappings = 0

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

" Rust
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" smart search highlighting 
Plug 'romainl/vim-cool'

" color schemes
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'ap/vim-css-color', {'for': ['css', 'rmd']}

" Writing mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Indents
Plug 'Yggdroot/indentLine'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

