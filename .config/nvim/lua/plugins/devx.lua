vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})

return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        diagnostics = {
          groups = {
            { "filename", format = "{file_icon} {basename:Title} {count}" },
          },
        },
      },
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    --@module 'blink.cmp'
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
          --
          -- See :h blink-cmp-config-keymap for defining your own keymap
          keymap = { preset = 'super-tab' },

          appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
          },

          -- (Default) Only show the documentation popup when manually triggered
          completion = { documentation = { auto_show = true } },

          -- Default list of enabled providers defined so that you can extend it
          -- elsewhere in your config, without redefining it, due to `opts_extend`
          sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
          },

          -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
          -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
          -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
          --
          -- See the fuzzy documentation for more information
          fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    },
    {
      'nvim-telescope/telescope.nvim', version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      }
    },

    {
      "mason-org/mason-lspconfig.nvim",
      opts = {},
      dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
      },
    },
    {
      "pwntester/octo.nvim",
      cmd = "Octo",
      opts = {
        -- or "fzf-lua" or "snacks" or "default"
        picker = "telescope",
        -- bare Octo command opens picker of commands
        enable_builtin = true,
        use_local_fs = true,
      },
      keys = {
        {
          "<leader>oi",
          "<CMD>Octo issue list<CR>",
          desc = "List GitHub Issues",
        },
        {
          "<leader>op",
          "<CMD>Octo pr list<CR>",
          desc = "List GitHub PullRequests",
        },
        {
          "<leader>od",
          "<CMD>Octo discussion list<CR>",
          desc = "List GitHub Discussions",
        },
        {
          "<leader>on",
          "<CMD>Octo notification list<CR>",
          desc = "List GitHub Notifications",
        },
        {
          "<leader>os",
          function()
            require("octo.utils").create_base_search_command { include_current_repo = true }
          end,
          desc = "Search GitHub",
        },
      },
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        -- OR "ibhagwan/fzf-lua",
        -- OR "folke/snacks.nvim",
        "nvim-tree/nvim-web-devicons",
      },
    },
    {
      'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = {
          rust = { "rustfmt", lsp_format = "fallback" },
          ruby = { "rubocop", lsp_format = "fallback" },
          python = { "ruff_format" }
        },
      }
    }
  }
