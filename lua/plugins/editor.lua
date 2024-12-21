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
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "_",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "-", desc = "Explorer NeoTree (Root Dir)", remap = true },
    },
    opts = function(_, opts)
      opts.window.position = "float"
      opts.window.mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        -- ["<space>"] = "none",
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
        ["P"] = { "toggle_preview", config = { use_float = false } },
        ["<space>p"] = {
          function(state)
            vim.cmd("!fim " .. state.tree:get_node().path)
          end,
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
  -- {
  --   "stevearc/oil.nvim",
  --   config = function()
  --     function _G.get_oil_winbar()
  --       local dir = require("oil").get_current_dir()
  --       if dir then
  --         return vim.fn.fnamemodify(dir, ":~")
  --       else
  --         -- If there is no current directory (e.g. over ssh), just show the buffer name
  --         return vim.api.nvim_buf_get_name(0)
  --       end
  --     end
  --     require("oil").setup({
  --       win_options = {
  --         winbar = "%!v:lua.get_oil_winbar()",
  --       },
  --       view_options = {
  --         show_hidden = true,
  --       },
  --     })
  --     vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
  --   end,
  -- },
}
