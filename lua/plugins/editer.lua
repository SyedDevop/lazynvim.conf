return {
  -- customize file explorer
  -- {
  --   "folke/todo-comments.nvim",
  --   opts = function(_, opts)
  --     opts.search = {
  --       command = "rg",
  --       args = {
  --         "--color=never",
  --         "--no-heading",
  --         "--with-filename",
  --         "--line-number",
  --         "--column",
  --       },
  --       -- regex that will be used to match keywords.
  --       -- don't replace the (KEYWORDS) placeholder
  --       pattern = [[\b(KEYWORDS)\s:|\b(KEYWORDS):]], -- ripgrep regex
  --       -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  --     }
  --   end,
  -- },

  {
    "nexcov/compile-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>cM", function()
        vim.cmd("CompileMode")
      end)
    end,
  },
  -- {
  --   "ej-shafran/compile-mode.nvim",
  --   version = "^5.0.0",
  --   -- you can just use the latest version:
  --   -- branch = "latest",
  --   -- or the most up-to-date updates:
  --   -- branch = "nightly",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     -- if you want to enable coloring of ANSI escape codes in
  --     -- compilation output, add:
  --     -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
  --   },
  --   config = function()
  --     ---@type CompileModeOpts
  --     vim.g.compile_mode = {
  --       -- to add ANSI escape code support, add:
  --       -- baleia_setup = true,
  --
  --       -- to make `:Compile` replace special characters (e.g. `%`) in
  --       -- the command (and behave more like `:!`), add:
  --       -- bang_expansion = true,
  --     }
  --   end,
  -- },

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

  -- Hardtime for To improver vim motions
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      restricted_keys = {
        ["h"] = {}, -- dont restrict
        ["j"] = {},
        ["k"] = {},
        ["l"] = {},
      },
    },
  },

  --Spell Checker
  {
    "lucaSartore/fastspell.nvim",
    -- automatically run the installation script on windows and linux)
    -- if this doesn't work for some reason, you can
    build = function()
      local base_path = vim.fn.stdpath("data") .. "/lazy/fastspell.nvim"
      local cmd = base_path .. "/lua/scripts/install." .. (vim.fn.has("win32") and "cmd" or "sh")
      vim.system({ cmd })
    end,

    config = function()
      local fastspell = require("fastspell")

      -- call setup to initialize fastspell
      fastspell.setup({
        cspell_json_file_path = vim.fn.stdpath("config") .. "/cspell.json",
      })
      -- -- decide when to run the spell checking (see :help events for full list)
      -- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufEnter", "WinScrolled" }, {
      --   callback = function(_)
      --     -- decide the area in your buffer that will be checked. This is the default configuration,
      --     -- and look for spelling mistakes ONLY in the lines of the bugger that are currently displayed
      --     -- for more advanced configurations see the section bellow
      --     local first_line = vim.fn.line("w0") - 1
      --     local last_line = vim.fn.line("w$")
      --     fastspell.sendSpellCheckRequest(first_line, last_line)
      --   end,
      -- })
      -- run the spell checker only in the line the cursor is currently in, and the five adjacent to it
      vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
        callback = function(_)
          local current_row = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[1]
          local first_line = current_row - 5
          local last_line = current_row + 4
          fastspell.sendSpellCheckRequest(first_line, last_line)
        end,
      })

      vim.api.nvim_set_keymap("n", "<leader>sc", "", {
        noremap = true,
        silent = true,
        desc = "[S]pell [C]heck",
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          local first_line = 0
          local last_line = vim.api.nvim_buf_line_count(buffer)
          fastspell.sendSpellCheckRequest(first_line, last_line)
        end,
      })
      vim.api.nvim_set_keymap("n", "<leader>si", "", {
        noremap = true,
        silent = true,
        desc = "Remove spell check for buffer",
        callback = function()
          fastspell.sendSpellCheckRequest(0, 0)
        end,
      })
    end,
  },
}
