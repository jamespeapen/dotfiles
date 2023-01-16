set rtp+=~/.local/share/nvim/plugged/firenvim
set rtp+=~/.local/share/nvim/plugged/gruvbox.nvim
set rtp+=~/.local/share/nvim/plugged/coc.nvim

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

syntax on
let mapleader = "\<Space>"
imap ,m <Esc>
vmap ,m <Esc>
nnoremap fp gq}$
" move by one line not sentence
nmap j gj
nmap k gk
vnoremap j gj
vnoremap k gk


nnoremap <Leader>q :q<CR>
nnoremap <Leader>11 :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

set background=light
colorscheme gruvbox

set spell
source ~/.config/nvim/autocorrect.vim
