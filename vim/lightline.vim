" lightline setup
set laststatus=2
if !exists('g:fzf_layout')
    autocmd! FileType fzf
    autocmd FileType fzf set laststatus = 0 noshowmode noruler
                \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif


" lightline config 
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'right': [ ['lineinfo'],
      \              ['percent'],
      \              ['filetype', 'fileformat']],
      \   'left': [ [ 'mode', 'paste', 'coc-status'],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ,
      \             [ 'venv', 'wordcount'] ]
      \ },
      \ 'component_function': {
      \   'colorscheme_name': 'Color',
      \   'gitbranch': 'LightlineFugitive',
      \   'venv': 'virtualenv#statusline',
      \   'modified': 'LightlineModified',
      \   'wordcount': 'Get_wordcount',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '⟫', 'right': '⟪' }
      \ }

function! MyFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return WebDevIconsGetFileFormatSymbol() 
endfunction

" show branch icon and name
function! LightlineFugitive()
		if exists('*FugitiveHead')
			let branch = FugitiveHead()
			return branch !=# '' ? ' '.branch : ''
		endif
		return ''
	endfunction

" show if file is modified
function! LightlineModified()
		return &modifiable && &modified ? '+' : ''
	endfunction

" show wordcount
function! Get_wordcount()
        let wordcount = wordcount().words
        return wordcount . ' words'
    endfunction
