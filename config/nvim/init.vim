if exists('g:started_by_firenvim')
    source ~/.config/nvim/firenvim.vim
    source ~/.config/nvim/autocorrect.vim
else
    source ~/.config/nvim/plugins.vim
    source ~/.config/nvim/mappings.vim
    source ~/.config/nvim/lightline.vim
    source ~/.config/nvim/ui.vim
    source ~/.config/nvim/settings.vim
endif
