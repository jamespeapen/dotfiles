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

" autocompletions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" R
Plug 'jalvesaq/Nvim-R'

" VimWiki
Plug 'vimwiki/vimwiki'

" Latex
Plug 'lervag/vimtex'

" Rust
Plug 'rust-lang/rust.vim'

" Fuzzy finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" smart search highlighting 
Plug 'romainl/vim-cool'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'

" Writing mode
Plug 'junegunn/goyo.vim'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Indents
Plug 'Yggdroot/indentLine'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()

