return {
  {
    "romainl/vim-cool",
    -- event = "SearchWrapped",
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    init = function()
      vim.keymap.set('n', '<F5>', ":UndotreeToggle<CR>")
    end
  },
  {
    'preservim/nerdtree',
    cmd = 'NERDTreeToggle',
    desc = "test"
  },
  {
    'tpope/vim-obsession',
    cmd = 'Obsession',
  },
}
