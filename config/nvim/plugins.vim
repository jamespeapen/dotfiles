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
Plug 'AndrewRadev/splitjoin.vim', { 'for': [ 'cpp', 'python', 'javascript', 'json', 'zsh', 'r', 'rmd', 'rs', 'lua'] }
" <<<
let g:splitjoin_python_brackets_on_separate_lines = 1
let g:r_indent_align_args = 0
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
" <<<
highlight link GitSignsCurrentLineBlame GruvboxFg3
" >>>
Plug 'AndrewRadev/linediff.vim', { 'on': 'Linediff' }

" Snippets
Plug 'SirVer/ultisnips'
" <<<
let g:UltiSnipsExpandTrigger="<C-I>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" >>>

Plug 'jamespeapen/vim-snippets'

" REPL
Plug 'jamespeapen/iron.nvim', { 'branch': 'dev', 'for': [ 'python'] }

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

" Refactoring
Plug 'ThePrimeagen/refactoring.nvim'

"-------------------- LANGUAGE PLUGINS 

" R
Plug 'R-nvim/R.nvim', { 'for': ['r', 'rmd', 'quarto'] }
Plug 'R-nvim/cmp-r'

" Markdown
Plug 'vim-pandoc/vim-pandoc' ", { 'for': [ 'markdown', 'rmd', 'quarto']}
" <<<
let g:pandoc#formatting#mode = 'h'
let g:pandoc#folding#level = 2
let g:pandoc#keyboard#use_default_mappings = 0
let g:pandoc#command#latex_engine = "pdflatex"
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
Plug 'nvim-lualine/lualine.nvim'

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
require('gitsigns').setup {
current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 200,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d> - <summary>',
}

require('r').setup {
  R_args = {"--quiet", "--no-save"}, 
  rconsole_height=25,
  rconsole_width=170,
  buffer_opts = "nobuflisted",
  objbr_w=35,
  Rout_more_colors = true,
  bracketed_paste = true,
  rmdchunk = "``",
}

-- let R_objbr_w=35
-- let R_nvimpager = "horizontal"
-- let R_assign = 2 " underscrore to '<-': on 2
-- let R_debug_center = 1
-- let g:rmd_fenced_languages = ['r', 'python', 'bash=sh', 'sh', 'awk', 'sed', 'cpp']
-- let R_openhtml = 0 " don't open html in default browser on knit
-- let R_openpdf = 1 " don't open html in default browser on knit
-- let r_indent_ess_comments = 0
-- let R_rmdchunk = 0

local iron = require("iron.core")

iron.setup {
  config = {
    repl_definition = {
      python = {
        command = { "python" },  -- or { "ipython", "--no-autoindent" }
        format = require("iron.fts.common").bracketed_paste_python
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = require('iron.view').split.vertical("50%"),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    -- send_motion = "<LocalLeader>l",
    visual_send = "<LocalLeader>ss",
    send_file = "<LocalLeader>fa",
    send_line = "<LocalLeader>l",
    send_line_down = "<LocalLeader>d",
    send_paragraph = "<LocalLeader>pp",
    send_paragraph_down = "<LocalLeader>pd",
    send_word = "<LocalLeader>rp",
    send_until_cursor = "<LocalLeader>su",
    send_mark = "<LocalLeader>sm",
    mark_motion = "<LocalLeader>mc",
    mark_visual = "<LocalLeader>mc",
    remove_mark = "<LocalLeader>md",
    cr = "<LocalLeader>s<cr>",
    interrupt = "<LocalLeader>s<LocalLeader>",
    exit = "<LocalLeader>rq",
    clear = "<LocalLeader>rr",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<LocalLeader>rf', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<LocalLeader>rR', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<LocalLeader>rF', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<LocalLeader>rq', '<cmd>IronHide<cr>')

EOF

" vim:foldmethod=marker:fmr=<<<,>>>
