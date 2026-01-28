return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
  
  ┓   ╹       ┓  
  ┃┏┓╋ ┏  ┏┏┓┏┫┏┓
  ┗┗ ┗ ┛  ┗┗┛┗┻┗ 
                
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.always_show_bufferline = true
      return opts
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    cond = vim.g.neovide == nil,
    opts = {
      smear_between_buffers = false,
    },
  },
  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    "nvim-mini/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.open = {
        enable = false,
      }
      opts.close = {
        enable = false,
      }
      return opts
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.section_separators = ""
      return opts
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = "2"
      vim.g.gruvbox_material_disable_terminal_colors = "1"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_float_style = "dim"
    end,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = function(_, opts)
      opts.disable = {
        colored_cursor = true,
        background = true,
        term_colors = true,
      }
      opts.lualine_style = "stealth"
      opts.high_visibility = {
        darker = true,
      }
      return opts
    end,
  },
  {
    "kvrohit/rasmus.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.rasmus_transparent = true
    end,
  },
}
