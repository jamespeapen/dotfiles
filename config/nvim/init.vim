" Install vim-plug
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  source ~/.config/nvim/plugins.vim
  autocmd VimEnter * PlugInstall --sync | echo "Plugins installed - quitting. Reopen to finish setup" | sleep 5 | qa!

else

  if exists('g:started_by_firenvim')
      source ~/.config/nvim/firenvim.vim
      source ~/.config/nvim/autocorrect.vim
  else
      source ~/.config/nvim/plugins.vim
      source ~/.config/nvim/mappings.vim
      source ~/.config/nvim/lightline.vim
      source ~/.config/nvim/ui.vim
      source ~/.config/nvim/settings.vim
      source ~/.config/nvim/treesitter.vim
      source ~/.config/nvim/lsp.lua
      source ~/.config/nvim/telescope.lua
      autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
      au BufEnter neomutt* source ~/.config/nvim/autocorrect.vim
  endif

  if exists("g:neovide")
      set guifont=Iosevka:h15
      let g:neovide_hide_mouse_when_typing = 1
      let g:neovide_cursor_trail_size=0.5
  endif

endif
