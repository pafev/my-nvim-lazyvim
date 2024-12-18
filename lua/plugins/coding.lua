return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }),
        ["<tab>"] = function(fallback)
          return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
        end,
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<esc>"] = cmp.mapping.abort(),
      })
      opts.experimental = {
        ghost_text = false,
      }
      return opts
    end,
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
    branch = "master",
  },
}
