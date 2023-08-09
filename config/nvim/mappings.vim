" Mappings

" set leader
let mapleader = "\<Space>"
let maplocalleader = "\\"

" map ,m to Esc 
imap ,m <Esc>
vmap ,m <Esc>
tnoremap ,m <C-\><C-n>

" map C-space to nothing to prevent C-@ from being called
imap <C-space> <Nop>

" nvim write and quit shortcuts
nnoremap <Leader>q :q<CR>
nnoremap <Leader>11 :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

" pane switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" tabs
nmap <leader>l gt
nmap <leader>h gT

" splits
nnoremap <Leader>vs :vsplit<CR>

" prose editing
function! Prose()
    :Goyo 90
    :set spell
    :source ~/.config/nvim/autocorrect.vim
    ":syntax on
endfunction

function! Gy()
    :Goyo 90
    :set relativenumber
    :set number
endfunction

nnoremap <silent><Leader>pr :call Prose()<CR>
nnoremap <silent><Leader>gy :call Gy()<CR>

" format full document
nnoremap <Leader>fd gggwGgg
" format paragraph
nnoremap <Leader>fp gw}

" get wordcount
nnoremap <Leader>wc :echo wordcount().words . " words"<CR>

" move by one line not sentence
nmap j gj
nmap k gk
vnoremap j gj
vnoremap k gk

" fugitive
nmap <Leader>gc :w<CR> :tab :Git commit -v %<CR>
nmap <Leader>gp :Git push

" toggle NERDtree
nmap OP :NERDTreeToggle<CR> 

" Tagbar toggle
nmap TB :TagbarToggle <CR>
" switch focus to tagbar - assuming its the rightmost file
nmap EI :9 wincmd l <CR>

" xclip
vmap <Leader>y "+y

" Special chars
imap ,be β
imap ,al α

" magrittr pipe
ia -\ %>%

" Syntax
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <F3> :call SynStack()<CR>
