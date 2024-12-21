return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "prisma-language-server",
        "css-lsp",
        "prettier",
        "eslint_d",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = function(_, opts)
      opts.diagnostics.update_in_insert = true
      opts.document_highlight = {
        enabled = false,
      }
      opts.diagnostics.virtual_text = false
      opts.inlay_hints.exclude = {
        "vue",
        "typescript",
      }
      return opts
    end,
  },
}
