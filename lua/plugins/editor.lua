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
        "_",
        function()
          require("neo-tree.command").execute({ toggle = true, source = "buffers", position = "float" })
        end,
        desc = "Buffer Explorer",
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
        ["<space>p"] = {
          function(state)
            vim.cmd("!fim " .. state.tree:get_node().path)
          end,
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
    "adelarsq/image_preview.nvim",
    event = "VeryLazy",
  },
  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
  },
}
