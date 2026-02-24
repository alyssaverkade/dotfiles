return {
  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  "junegunn/fzf.vim" ,
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000 ,
    config = true,
    opts = {
      overrides = {},
      terminal_colors = true,
      contrast = "hard",
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      }
    }
  },
  "luochen1990/rainbow",
  "sheerun/vim-polyglot",
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end,
    priority = 999,
    opts = {},
  },
  { "tamton-aquib/staline.nvim", opts = {} },
  "editorconfig/editorconfig-vim",
  "wellle/targets.vim",
  "wellle/visual-split.vim",
  "Raimondi/delimitMate",
  "farmergreg/vim-lastplace",
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
