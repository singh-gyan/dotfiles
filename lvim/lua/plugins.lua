lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "tpope/vim-surround",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  { "terryma/vim-multiple-cursors" },
  { "windwp/nvim-autopairs" },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- { 'tzachar/cmp-tabnine',   build = './install.sh', dependencies = 'hrsh7th/nvim-cmp' },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    lazy = true,
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  { "catppuccin/nvim" },
  { 'rose-pine/neovim', name = 'rose-pine' },
  {
    'navarasu/onedark.nvim',
  },
  {
    "APZelos/blamer.nvim",
  },
  { 'mbbill/undotree' },
  { "ThePrimeagen/harpoon" },
  { 'christoomey/vim-tmux-navigator' },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      local context = require 'treesitter-context'
      context.setup { max_lines = 2 }
      vim.keymap.set("n", "[c", function()
        context.go_to_context()
      end, { silent = true })
    end
  },
  -- { "ray-x/guihua.lua",      build = "cd lua/fzy && make" },
  -- {
  --   "ray-x/navigator.lua",
  --   event = "BufEnter",
  --   lazy = true,
  --   config = function()
  --     require("configs.navigator")
  --   end,
  --   dependencies = {
  --     { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  --   },
  -- },
  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
  { "gbprod/yanky.nvim" },
  {
    "sindrets/diffview.nvim",
  },
  { "hrsh7th/cmp-cmdline", enabled = true },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-i>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
    config = function()
      require("flash").jump({
        remote_op = {
          restore = true,
          motion = true,
        },
      })
    end
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    lazy = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    -- cmd = "Neorg",
  },
}
