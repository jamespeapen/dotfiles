set rtp+=~/.config/nvim/plugged/firenvim
set rtp+=~/.config/nvim/plugged/gruvbox
set rtp+=~/.config/nvim/plugged/coc.nvim


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

nnoremap <Leader>q :q<CR>
nnoremap <Leader>11 :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

set background=light
