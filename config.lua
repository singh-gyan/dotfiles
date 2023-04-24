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
-- vim.opt.clipboard = "unnamed"
-- general
lvim.log.level = "warn"
lvim.colorscheme = "catppuccin-mocha"
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
lvim.keys.normal_mode[";"] = ":"

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
lvim.keys.normal_mode["<leader>ss"] = ":SymbolsOutline<CR>"
-- lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<CR>"
-- lvim.keys.normal_mode["<leader>bj"] = ':lua require("harpoon.ui").nav_next()<CR>'
-- lvim.keys.normal_mode["<leader>bk"] = ':lua require("harpoon.ui").nav_prev()<CR>'
-- lvim.keys.normal_mode["<leader>bt"] = ':lua require("harpoon.ui").toggle_quick_menu()<CR>'
-- lvim.keys.normal_mode["<leader>ba"] = ':lua require("harpoon.ui").toggle_quick_menu()<CR>'
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Change theme settings
-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
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

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumneko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "isort", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "scss" },
  },
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

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
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
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
          show_integration_count = false,
        },
      })
    end
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
lvim.autocommands = {
  {
    { "BufEnter", "Filetype" },
    {
      desc = "Open mini.map and exclude some filetypes",
      pattern = { "*" },
      callback = function()
        local exclude_ft = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        }

        local map = require('mini.map')
        if vim.tbl_contains(exclude_ft, vim.o.filetype) then
          vim.b.minimap_disable = true
          map.close()
        elseif vim.o.buftype == "" then
          map.open()
        end
      end,
    },
  },
}


lvim.builtin.treesitter.textobjects = {
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]c"] = { query = "@class.outer", desc = "Next class start" },
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
      ["]C"] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[c"] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[C"] = "@class.outer",
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

--lualine config

--Helpful keybinding
-- <c-e>  - exit code completion
-- <c-space>  - Show code completion
-- <leader>tr - Show refrences under the cursor with preivews (bertter than gr)
-- <leader>Sl - open last session
-- :norm command to edit miliplt lines at the start or end
--    Ex - :norm A, -- This will append , on the selected or the current line
-- Telescope jumplist - Show jumplist enterires
-- Telescope command_history - Show command history in neovim terminal


--Useful plugins or setting for certains tasks

--   diffview - To go through file git history and compare wwith current view. Also use to resolve git conflicts
--            commands - Diffviewopen
