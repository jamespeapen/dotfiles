return {
  {
    'lervag/vimtex',
    ft = {'tex', 'plaintex'},
    init = function()
      vim.g.tex_flavor = "latex"
    end
  },
  {
    'vim-pandoc/vim-pandoc',
    ft = { 'markdown', 'rmd', 'quarto' },
    init = function()
      vim.g["pandoc#formatting#mode"] = 'h'
      vim.g["pandoc#folding#level"] = 2
      vim.g["pandoc#keyboard#use_default_mappings"] = 0
      vim.g["pandoc#command#latex_engine"] = "pdflatex"
    end
  },
  {
    'vim-pandoc/vim-pandoc-syntax',
    ft = {'markdown', 'rmd', 'quarto'},
  },
  {
    "quarto-dev/quarto-vim",
    ft = 'quarto'
  },
  {
    'dkarter/bullets.vim',
    ft = {'markdown', 'rmd', 'quarto'},
    init = function()
      vim.g.bullets_line_spacing = 2
      vim.g.bullets_enabled_file_types = {'markdown', 'rmd',  'gitcommit'}
    end
  },
}
