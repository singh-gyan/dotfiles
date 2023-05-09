--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- vim.opt.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
-- general
lvim.log.level = "warn"
lvim.colorscheme = "dracula"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua", --Add more file types to format on save
  timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.insert_mode["kj"] = "<ESC>"
lvim.keys.normal_mode["dd"] = '"_dd'
lvim.keys.normal_mode["D"] = '"_D'
lvim.keys.visual_mode["d"] = '"_d'
lvim.keys.normal_mode["d"] = '"_d'
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-e>"] = ":e!<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<A-h>"] = ":BufferLineMovePrev<CR>"
lvim.keys.normal_mode["<A-,>"] = "A,<ESC>"
lvim.keys.normal_mode["<A-.>"] = "A.<ESC>"
lvim.keys.normal_mode["<leader>Q"] = ":lua vim.lsp.buf.format()<CR>"
lvim.keys.visual_mode["<leader>Q"] = ":lua vim.lsp.buf.range_formatting()<CR>"
lvim.keys.normal_mode["<leader>'p"] = '"+p:s/\n/ /g<CR>'
lvim.keys.normal_mode["<leader>p"] = "o<ESC>p"
lvim.keys.normal_mode["<leader>P"] = "O<ESC>p"
lvim.keys.normal_mode["<leader>o"] = "o<ESC>"
lvim.keys.normal_mode["<leader>O"] = "O<ESC>"
lvim.keys.normal_mode["<leader>sS"] = ":SymbolsOutline<CR>"
lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<CR>"



lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["m"] = {
  name = "MiniMap",
  m = { "<cmd>lua MiniMap.toggle_focus()<CR>", "Toggle focus" },
  c = { "<cmd>lua MiniMap.toggle()<cr>", "Toggle" },
}
lvim.builtin.which_key.mappings["/"] = { "<cmd>nohlsearch<CR>", "No Highlight" }
lvim.builtin.which_key.mappings[";"] = {}

lvim.builtin.which_key.mappings["s"]["w"] = {
  "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
  " Search Word Under Cursor"
}
lvim.builtin.which_key.mappings["s"]["s"] = {
  "<cmd>Telescope resume<CR>",
  "Resume"
}
lvim.builtin.which_key.mappings["s"]["p"] = {
  "<cmd>Telescope projects<CR>",
  "Projects"
}
lvim.builtin.which_key.mappings["h"] = {
  name = " Harpoon",
  m = { ":lua require('harpoon.mark').add_file()<cr>", "Mark file" },
  t = { ":lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
  a = { ":lua require('harpoon.ui').nav_file(1)<cr>", "Goto mark 1" },
  s = { ":lua require('harpoon.ui').nav_file(2)<cr>", "Goto mark 2" },
  d = { ":lua require('harpoon.ui').nav_file(3)<cr>", "Goto mark 3" },
  f = { ":lua require('harpoon.ui').nav_file(4)<cr>", "Goto mark 4" },
  g = { ":lua require('harpoon.ui').nav_file(5)<cr>", "Goto mark 5" },
  q = { ":lua require('harpoon.ui').nav_file(6)<cr>", "Goto mark 6" },
  w = { ":lua require('harpoon.ui').nav_file(7)<cr>", "Goto mark 7" },
  e = { ":lua require('harpoon.ui').nav_file(8)<cr>", "Goto mark 8" },
  r = { ":lua require('harpoon.ui').nav_file(9)<cr>", "Goto mark 9" },
  l = { ":lua require('harpoon.ui').nav_next()<cr>", "Next file" },
  h = { ":lua require('harpoon.ui').nav_prev()<cr>", "Prev file" },
}

--Keybindings for Hop to work in v,s,d mode
local default_opts = { noremap = true, silent = true }
local keymap = function(mode, from, to, opts)
  if not opts then opts = default_opts end
  vim.keymap.set(mode, from, to, opts)
end
local nkeymap = function(from, to, opts)
  keymap("n", from, to, opts)
end
local hop_ok, hop = pcall(require, 'hop')
if hop_ok then
  local directions = require('hop.hint').HintDirection
  local modes = { 'n', 'o', 'v' }
  local opts = { remap = true, silent = true }
  keymap(modes, 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
  end, opts)

  keymap(modes, 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
  end, opts)

  keymap(modes, 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
  end, opts)

  keymap(modes, 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
  end, opts)

  -- nkeymap('s', function()
  --   hop.hint_char2({ direction = directions.AFTER_CURSOR })
  -- end, opts)

  -- nkeymap('S', function()
  --   hop.hint_char2({ direction = directions.BEFORE_CURSOR })
  -- end, opts)
end



-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "scss" },
  },
}

-- Additional Plugins
lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "S", ":HopLineStart<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
    end,
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
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup({
        width = 30,
        wrap = true
      })
    end
  },
  { 'sindrets/diffview.nvim',      requires = 'nvim-lua/plenary.nvim' },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  { "catppuccin/nvim",       name = "catppuccin" },
  { "rebelot/kanagawa.nvim", name = "catppuccin" },
  {
    "sainnhe/gruvbox-material"
  },
  {
    "echasnovski/mini.map",
    branch = "stable",
    config = function()
      require('mini.map').setup()
      local map = require('mini.map')
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic({
            error = 'DiagnosticFloatingError',
            warn  = 'DiagnosticFloatingWarn',
            info  = 'DiagnosticFloatingInfo',
            -- hint  = 'DiagnosticFloatingHint',
          }),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot('4x2'),
        },
        window = {
          side = 'right',
          width = 8, -- set to 1 for a pure scrollbar :)
          winblend = 15,
        },
        show_integration_count = false,
      })
    end,
  },

  {
    'navarasu/onedark.nvim',
    config = function()
      require("onedark").setup {
        transparent = true, style = 'darker' }
    end
  },
  {
    'Mofiqul/dracula.nvim',
    config = function()
      require("dracula").setup({
        colors = {
          -- bg = "#1b1d26",
          selection = "#3a3b42",
        }
      })
    end
  },
  {
    "APZelos/blamer.nvim",
    config = function()
      vim.g.blamer_enabled = 1
      vim.g.blamer_delay = 300
      vim.g.blamer_relative_time = 1
      vim.g.blamer_date_format = '%b %e %H:%M'
      -- vim.g.blamer_message_template = '<committer>, <committer-time> • <summary>'
    end,
  },
  { 'mbbill/undotree' },
  { "ThePrimeagen/harpoon" },
  { 'christoomey/vim-tmux-navigator' }
}

-- lvim.autocommands = {
--   {
--     { "BufEnter", "Filetype" },
--     {
--       desc = "Open mini.map and exclude some filetypes",
--       pattern = { "*" },
--       callback = function()
--         local exclude_ft = {
--           "qf",
--           "NvimTree",
--           "toggleterm",
--           "TelescopePrompt",
--           "alpha",
--           "netrw",
--         }

--         local map = require('mini.map')
--         if vim.tbl_contains(exclude_ft, vim.o.filetype) then
--           vim.b.minimap_disable = true
--           map.close()
--         elseif vim.o.buftype == "" then
--           map.open()
--         end
--       end,
--     },
--   },
-- }


lvim.builtin.treesitter.textobjects = {
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]k"] = { query = "@class.outer", desc = "Next class start" },
      --
      -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
      ["]o"] = "@loop.*",
      -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
      --
      -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
      -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
      ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
      ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]K"] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[k"] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[K"] = "@class.outer",
    },
    -- Below will go to either the start or the end, whichever is closer.
    -- Use if you want more granular movements
    -- Make it even more gradual by adding multiple queries and regex.
    goto_next = {
      ["]d"] = "@conditional.outer",
    },
    goto_previous = {
      ["[d"] = "@conditional.outer",
    },
  },
}
lvim.builtin.treesitter.autotag = {
  enable = true
}
lvim.builtin.treesitter.ensure_installed = {
  'scss', 'lua', 'javascript', 'typescript', 'css'
}
lvim.builtin.treesitter.context_commentstring = {
  enable = true
}
--Bufferline Tab
lvim.builtin.bufferline.options.separator_style = "slant"

--Terminal Config
lvim.builtin["terminal"].direction = "tab"
lvim.builtin["terminal"].exces = {
  { nil, "<M-1>", "Tab Terminal",      "tab",      0.3 },
  { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
  { nil, "<M-3>", "Float Terminal",    "float",    nil },
}
lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "<c-space>",
    node_incremental = "<c-space>",
    scope_incremental = "<c-s>",
    node_decremental = "<m-space>",
  },
}


-- Nvim Tree Conf
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.actions.change_dir.enable = false

--Telescope Conf
lvim.builtin.telescope.pickers.find_files.find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }

--luasnip conf
require("luasnip").filetype_extend("typescript", { "javascript" })

--Indentation config
-- lvim.builtin.indentlines.space_char_blankline = " "
lvim.builtin.indentlines.show_current_context_start = true
lvim.builtin.indentlines.show_current_context = true
--
-- show_current_context_start = true,
-- }

--lualine config
-- local components = require "~/.local/share/lunarvim/lvim/lua/lvim.core.lualine.components"
lvim.builtin.lualine.sections.lualine_c = { 'diff', '%F' }
lvim.builtin.lualine.sections.lualine_x = { 'diagnostic', 'filetype' }

lvim.builtin.lualine.sections.lualine_y = {}
lvim.builtin.lualine.sections.lualine_z = {}

--TODO:-
--Custom console log
--Add colorful comment plugin


--Helpful keybinding
-- <c-e>  - exit code completion
-- <c-space>  - Show code completion
-- <leader>tr - Show refrences under the cursor with preivews (bertter than gr)
-- <leader>Sl - open last session
-- :norm command to edit miliplt lines at the start or end
--    Ex - :norm A, -- This will append , on the selected or the current line
-- Git conflict keybindings
--   co — choose ours
--   ct — choose theirs
--   cb — choose both
--   c0 — choose none
--   [x — move to next conflict
--   ]x — move to previous conflict
-- use <C-f> to list down the command history in command mode


--Useful plugins or setting for certains tasks

--   diffview - To go through file git history and compare wwith current view. Also use to resolve git conflicts
--            commands - Diffviewopen
-- Telescope jumplist - Show jumplist enterires
-- Telescope command_history - Show command history in neovim terminal

vim.cmd([[
  augroup CursorColor
    autocmd!
    autocmd ColorScheme * highlight Cursor guibg=#a0f75e guifg=black
  augroup END
]])
