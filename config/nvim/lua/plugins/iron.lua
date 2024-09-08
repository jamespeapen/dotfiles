return {
  {
    "jamespeapen/iron.nvim",
    branch = "dev",
    ft = "python",
    config = function()
      local iron = require("iron.core")
      iron.setup {
        config = {
          repl_definition = {
            python = {
              command = { "python" },  -- or { "ipython", "--no-autoindent" }
              format = require("iron.fts.common").bracketed_paste_python
            }
          },
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = require('iron.view').split.vertical("50%"),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          -- send_motion = "<LocalLeader>l",
          visual_send = "<LocalLeader>ss",
          send_file = "<LocalLeader>fa",
          send_line = "<LocalLeader>l",
          send_line_down = "<LocalLeader>d",
          send_paragraph = "<LocalLeader>pp",
          send_paragraph_down = "<LocalLeader>pd",
          send_word = "<LocalLeader>rp",
          send_until_cursor = "<LocalLeader>su",
          send_mark = "<LocalLeader>sm",
          mark_motion = "<LocalLeader>mc",
          mark_visual = "<LocalLeader>mc",
          remove_mark = "<LocalLeader>md",
          cr = "<LocalLeader>s<cr>",
          interrupt = "<LocalLeader>s<LocalLeader>",
          exit = "<LocalLeader>rq",
          clear = "<LocalLeader>rr",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }
      vim.keymap.set('n', '<LocalLeader>rf', '<cmd>IronRepl<cr>')
      vim.keymap.set('n', '<LocalLeader>rR', '<cmd>IronRestart<cr>')
      vim.keymap.set('n', '<LocalLeader>rF', '<cmd>IronFocus<cr>')
      vim.keymap.set('n', '<LocalLeader>rq', '<cmd>IronHide<cr>')
    end
  }
}
