return {
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    enabled = false,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "-",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), position = "float" })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), position = "right" })
        end,
        desc = "Explorer NeoTree (Root Dir) in left",
      },
    },
    opts = function(_, opts)
      opts.window.position = "right"
      opts.window.width = 36
      opts.window.mappings = {
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
        ["a"] = {
          "add",
          config = {
            show_path = "relative",
          },
        },
      }
      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      }
      opts.close_if_last_window = false
      return opts
    end,
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
  },
  {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function()
      require("lazydocker").setup({
        border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
        width = 0.9, -- width of the floating window (0-1 for percentage, >1 for absolute columns)
        height = 0.9, -- height of the floating window (0-1 for percentage, >1 for absolute rows)
      })
    end,
    event = "BufRead",
    keys = {
      {
        "<leader>gd",
        function()
          require("lazydocker").open()
        end,
        desc = "Open Lazydocker floating window",
      },
    },
  },
}
