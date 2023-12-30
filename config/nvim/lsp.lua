local nvim_lsp = require'lspconfig'

-- bindings
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<F1>', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.rename, bufopts)

    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', 'd[', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', 'd]', vim.diagnostic.goto_next, opts)

    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})

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
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
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

-- autopairs
require("nvim-autopairs").setup {}
-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
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
    filetypes = {"tex", "quarto"}
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
          extraArgs = {
              { "--target-dir", "/tmp/rust-analyzer-check" }
        }
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

--Go
require'lspconfig'.gopls.setup{}

-- Lua
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'bufopts', 'opts'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
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

