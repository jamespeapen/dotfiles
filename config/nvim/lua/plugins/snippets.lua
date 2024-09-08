return {
  {
    'SirVer/ultisnips',
    event = "InsertEnter",
    dependencies = "jamespeapen/vim-snippets",
    init = function()
      vim.g.UltiSnipsExpandTrigger="<C-I>"
      vim.g.UltiSnipsJumpForwardTrigger="<c-j>"
      vim.g.UltiSnipsJumpBackwardTrigger="<c-b>"
    end
  },
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
  },
}
