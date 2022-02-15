" Plugins
call plug#begin()

" Session restore
Plug 'tpope/vim-obsession'

"startup
Plug 'mhinz/vim-startify'

" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2- ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']},
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \]

" Nerdtree
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeHijackNetrw=1 " NERDTree to split mode
let NERDTreeQuitOnOpen=1

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

"Tagbar
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

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
let g:rmd_fenced_languages = ['r', 'python', 'bash=sh', 'sh', 'awk', 'sed']
let R_openhtml = 0 " don't open html in default browser on knit
let r_indent_align_args = 0 " Set vim-r-plugin to mimics ess :

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
Plug 'ellisonleao/gruvbox.nvim'
Plug 'ap/vim-css-color', {'for': ['css', 'rmd']}

" Writing mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim', { 'for': ['markdown', 'rmd'] }

" Devicons
Plug 'ryanoasis/vim-devicons'

" Indents
Plug 'Yggdroot/indentLine'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) }, 'on': [] }
call plug#end()

