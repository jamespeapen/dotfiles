local nvim_lsp = require'lspconfig'

-- Python
nvim_lsp.jedi_language_server.setup{
    filetypes = {"python"}
}

-- R
nvim_lsp.r_language_server.setup{
    filetypes = {"r", "rmd"}
}

-- Julia
require'lspconfig'.julials.setup{
}

-- LateX
require('lspconfig').texlab.setup{
    filetypes = {"latex", "quarto"}
}

-- Rust
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
    settings = {
      imports = {
          granularity = {
              group = "module",
          },
          prefix = "self",
      },
      checkOnSave = {
          command = "clippy",
      },
      cargo = {
          buildScripts = {
              enable = true,
          },
      },
      procMacro = {
          enable = true
      },
    }
  },
})

-- Bash
nvim_lsp.bashls.setup{}

-- Lua
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

nvim_lsp.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}

--- Ansible

require'lspconfig'.ansiblels.setup{}

-- Cmp
local cmp = require'cmp'

cmp.setup({
    view = {
        entries = {name = 'custom', selection_order = 'near_cursor'},
    },
    confirmation = {
        completeopt = "menu,menuone,noinsert"
    },
    snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<M-u>"] = cmp.mapping.scroll_docs(-4),
      ["<M-d>"] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'ultisnips' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
    }),
    experimental = {
        ghost_text = true
    }

})

cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
})
})

