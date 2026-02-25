return {
  {
    "neovim/nvim-lspconfig",
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        sources = cmp.config.sources({
          { name = 'orgmode' },
          { name = 'nvim_lsp' },
          { name = 'ultisnips' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<M-u>"] = cmp.mapping.scroll_docs(-4),
          ["<M-d>"] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
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
    end
  },
}

