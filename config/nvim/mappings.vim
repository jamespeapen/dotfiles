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
    :Goyo 82
    :set spell
    :source ~/.config/nvim/autocorrect.vim
endfunction

function! Gy()
    :Goyo 90
    :set relativenumber
    :set number
endfunction

nnoremap <silent><Leader>pr :call Prose()<CR>
nnoremap <silent><Leader>gy :call Gy()<CR>

" format full document
nnoremap <Leader>fd gggqGgg
" format paragraph
nnoremap <Leader>fp gq}<C-o>

" get wordcount
nnoremap <Leader>wc :echo wordcount().words . " words"<CR>

" move by one line not sentence
nmap j gj
nmap k gk
vnoremap j gj
vnoremap k gk

" FZF configs
nmap <Leader>b :Buffers<CR>
nmap <Leader>gf :GitFiles<CR>
nmap <Leader>rg :Rg<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fh :Files~<CR>

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

" bibtex
function! Bibtex_ls()
  let bibfiles = (
      \ globpath('.', '*.bib', v:true, v:true) +
      \ globpath('..', '*.bib', v:true, v:true) +
      \ globpath('../', '*.bib', v:true, v:true) +
      \ globpath('../../', '*.bib', v:true, v:true) +
      \ globpath('*/', '*.bib', v:true, v:true)
      \ )
  let bibfiles = join(bibfiles, ' ')
  let source_cmd = 'bibtex-ls '.bibfiles
  return source_cmd
endfunction

function! s:bibtex_cite_sink_insert(lines)
    if &filetype == 'rmd' || &filetype == 'quarto'
        let r=system("bibtex-cite -mode=pandoc -separator=';'", a:lines)
    elseif &filetype == 'tex'
        let r=system("bibtex-cite -mode=latex ", a:lines)
    endif
    execute ':normal! i' . r
    call feedkeys('a', 'n')
endfunction

inoremap <silent> @@ <c-g>u<c-o>:call fzf#run({
                        \ 'source': Bibtex_ls(),
                        \ 'sink*': function('<sid>bibtex_cite_sink_insert'),
                        \ 'up': '40%',
                        \ 'options': '--ansi --layout=reverse-list --multi --prompt "Cite> "'})<CR>

" Syntax
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <F3> :call SynStack()<CR>
