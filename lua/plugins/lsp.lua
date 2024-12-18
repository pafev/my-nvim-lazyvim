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
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.diagnostics.update_in_insert = true
      opts.document_highlight = {
        enabled = false,
      }
      return opts
    end,
  },
}
