return {
  {
    "R-nvim/R.nvim",
    dependencies = { "R-nvim/cmp-r" },
    config = function ()
      -- Create a table with the options to be passed to setup()
      local opts = {
        hook = {
          on_filetype = function()
            vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
            vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
          end
        },
        R_args = {"--quiet", "--no-save"},
        buffer_opts = "nobuflisted",
        Rout_more_colors = true,
        bracketed_paste = true,
        rmdchunk = "``",
        min_editor_width = 72,
        rconsole_height=25,
        rconsole_width=170,
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
      require("cmp_r").setup({
        filetypes = {"r", "rmd", "quarto"},
        fun_data_1 = {"melt", "lm", "subset", "with"},
        fun_data_2 = {ggplot = {'aes'}, with = {'*'}},
        doc_width = 58,
      })
    end,
    lazy = false
  },
}
