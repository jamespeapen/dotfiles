return {
  {
    'glacambre/firenvim',
    lazy = not vim.g.started_by_firenvim,
    build = ":call firenvim#install(0)",
    init = function()
      vim.g.firenvim_config = {
        localSettings =  {
          [ ".*" ] =  {
            cmdline = 'neovim',
            content = 'text',
            priority = 0,
            selector = 'textarea',
            takeover = 'never',
          },
        },
        globalSettings =  {
          [ [[alt]] ] = 'all',
        },
      }
    end
  }
}

