if exists('g:started_by_firenvim')
  set laststatus=0
  source ~/.config/nvim/firenvim.vim
else
  source ~/.config/nvim/plugins.vim
  source ~/.config/nvim/mappings.vim
  source ~/.config/nvim/ui.vim
  source ~/.config/nvim/lightline.vim
  source ~/.config/nvim/settings.vim
endif
