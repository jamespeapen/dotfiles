return {
  {
    "jamespeapen/R.nvim",
    branch = "devtools",
    build = 'git submodule update --init --recursive',
    config = function ()
      -- Create a table with the options to be passed to setup()
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_create_autocmd({ "BufEnter" }, {
              pattern = {"*.qmd", "*.rmd"},
              command = "set conceallevel=0 | set shiftwidth=2"
            })
          end
        },
        R_args = {"--quiet", "--no-save"},
        buffer_opts = "nobuflisted",
        Rout_more_colors = true,
        Rout_follow_colorscheme = true,
        bracketed_paste = true,
        min_editor_width = 100,
        rconsole_height = 25,
        rconsole_width = 120,
        objbr_w=35,
        disable_cmds = {
          "RCustomStart",
          "RSPlot",
          "RSaveClose",
        },
      }
      -- Check if the environment variable "R_AUTO_START" exists.
      -- If using fish shell, you could put in your config.fish:
      -- alias r "R_AUTO_START=true nvim"
      if vim.env.R_AUTO_START == "true" then
        opts.auto_start = "on startup"
        opts.objbr_auto_start = true
      end
      require("r").setup(opts)
    end,
    lazy = false
  },
}
