" Mappings
" set leader, indicator
:let mapleader = ","

" map jk to Esc  
imap jk <Esc>
vmap jk <Esc>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>w :w<CR>

" pane switching
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" prose editing
set spelllang=en
nnoremap <Leader>gy :Goyo 80<CR> :colo onedark<CR> :set spell<CR>

" move by one line
nnoremap j gj
nnoremap k gk

" FZF configs
nmap <Leader>ff :FZF
nmap <Leader>b :Buffers<CR>
nmap <Leader>gf :GitFiles <CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>ag :Ag<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>fh :Files~<CR>

" fugitive
nmap <Leader>gc :tab :Gcommit -v % <CR>
nmap <Leader>gp :Gpush <CR>

" toggle NERDtree
nmap OP :NERDTreeToggle<CR> 

" Tagbar toggle
nmap TB :TagbarToggle <CR>
" switch focus to tagbar - assuming its the rightmost file
nmap KL :9 wincmd l <CR>

" R setup
