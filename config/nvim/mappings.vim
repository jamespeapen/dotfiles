" Mappings

" set leader, indicator
:let mapleader = ","

" map jk to Esc  
imap ,m <Esc>
vmap ,m <Esc>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>11 :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

" pane switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" splits
nnoremap <Leader>vs :vsplit<CR>

" prose editing
set spelllang=en
function! Gy()
    :Goyo 100
    :set relativenumber
    :set number
endfunction

function! Prose()
    :Goyo 90
    :set spell
    :colo onedark
endfunction

nnoremap <silent><Leader>pr :call Prose()<CR>
nnoremap <silent><Leader>gy :call Gy()<CR>

" formatting document
nnoremap <Leader>fd gggqGgg
" format paragraph
nnoremap <Leader>fp gq{

" get wordcount
nnoremap <Leader>wc :echo wordcount().words . " words"<CR>

" move by one line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" FZF configs
nmap <Leader>b :Buffers<CR>
nmap <Leader>gf :GitFiles <CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>ag :Ag<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fh :Files~<CR>

" fugitive
nmap <Leader>gc :w<CR> :tab :Gcommit -v % <CR>
nmap <Leader>gp :Gpush <CR>

" toggle NERDtree
nmap OP :NERDTreeToggle<CR> 

" Tagbar toggle
nmap TB :TagbarToggle <CR>
" switch focus to tagbar - assuming its the rightmost file
nmap EI :9 wincmd l <CR>

" coc mappings
" map <CR> to select suggestion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" wayland clipboard support
xnoremap <Leader>y y:call system("wl-copy", @")<cr>

nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
