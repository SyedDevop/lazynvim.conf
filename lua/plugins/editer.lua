return {
  -- customize file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      filesystem = {
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      },
    },
  },

  -- git blame
  {
    "f-person/git-blame.nvim",
    event = "BufReadPre",
  },

  -- git conflict
  {
    "akinsho/git-conflict.nvim",
    event = "BufReadPre",
    config = true,
  },

  --which-key
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>o"] = { name = "+Open" },
      },
    },
  },
  --Fidget-nvim
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
  --Flit
  {
    "ggandor/flit.nvim",
    dependencies = { "tpope/vim-repeat", "ggandor/leap.nvim" },
    config = function()
      require("flit").setup({})
    end,
  },

  --mini.Surround
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn",
      },
    },
  },
  --Disable mini.ai to tags
  {
    "echasnovski/mini.ai",
    opts = function(_, opts)
      opts.custom_textobjects = {
        t = false, -- fallback to neovim for tags
      }
    end,
  },
}
