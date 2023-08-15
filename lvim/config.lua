---@diagnostic disable: undefined-global
-- Disbable project.nvim
lvim.builtin.project.active = false
-- Remove corresponding entry in dashboard
table.remove(lvim.builtin.alpha.dashboard.section.buttons.entries, 3)


vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

-- vim.opt.guicursor = "n-v-c-sm:block,ci-ve:ver25,r-cr-o:hor20,i:block-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
-- general
lvim.log.level = "warn"
-- lvim.colorscheme = "tokyonight-moon"
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
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "scss" },
  },
}

lvim.builtin.bufferline.active = false

require("plugins")

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ao"] = "@object",
      ["aC"] = "@comment.outer",
      -- You can optionally set descriptions to the mappings (used in the desc parameter of
      -- nvim_buf_set_keymap) which plugins like which-key display
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      -- You can also use captures from other query groups like `locals.scm`
      ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      ["aa"] = { query = "@parameter.outer", desc = "Select outer parameter" },
      ["ia"] = { query = "@parameter.inner", desc = "Select inner parameter" },
    },
    -- You can choose the select mode (default is charwise 'v')
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V",  -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    include_surrounding_whitespace = true,
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>a"] = "@parameter.inner",
    },
    swap_previous = {
      ["<leader>A"] = "@parameter.inner",
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]b"] = { query = "@block.outer", desc = "Block outer" },
      ["]]"] = { query = "@class.outer", desc = "Next class start" },
      --
      -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
      ["]o"] = { query = { "@loop.inner", "@loop.outer" } },
      --
      -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
      -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
      ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
      ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    },
    goto_next_end = {
      ["]C"] = "@comment.outer",
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
      ["]S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
      ["[s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
    },
    goto_previous_end = {
      ["[C"] = "@comment.outer",
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
      ["[S"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
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
    node_incremental = "<c-i>",
    scope_incremental = "<c-s>",
    node_decremental = "<m-space>",
  },
}


-- Nvim Tree Conf
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.actions.change_dir.enable = false
lvim.builtin.nvimtree.setup.sync_root_with_cwd = false

--Telescope Conf
local telescope_trouble = require("trouble.providers.telescope")
lvim.builtin.telescope.pickers.find_files.find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
lvim.builtin.telescope.defaults.path_display = {}
lvim.builtin.telescope.defaults.mappings["i"]["<C-t>"] = telescope_trouble.open_with_trouble
lvim.builtin.telescope.defaults.mappings["n"]["<C-t>"] = telescope_trouble.open_with_trouble


--Indentation config
lvim.builtin.indentlines.space_char_blankline = " "
lvim.builtin.indentlines.show_current_context_start = true
lvim.builtin.indentlines.show_current_context = true



require("globals")
require("keymappings")
require("autocommands")
require("options")
require("configs.which-key")
require("configs.miscellaneous")
require("configs.diffview")
require("configs.cmp")
require("configs.neorg")

require('onedark').setup({
  style = "deep",
  transparent = false,
  term_colors = true,
  code_style = {
    keywords = "none",
    variables = "italic",
    functions = "bold"
  },
  colors = {
    light_orange = "#ff8800",
  },
  highlights = {
    Search = { bg = '$grey', fg = '$light_orange' },
    CurSearch = { bg = '$grey', fg = '$light_orange' },
    IncSearch = { bg = '$grey', fg = '$light_orange' },
    Substitute = { bg = '$bg0', fg = '$green', fmt = "bold" },
    ["@function"] = { fg = "$yellow", fmt = "none" },
    ["@constructor"] = { fg = '$yellow', fmt = "none" },
  }
})
-- lvim.colorscheme = "catppuccin"
--TODO:-
--Custom console log
--Add colorful comment plugin

-- lvim.builtin.lualine.options.theme = 'catppuccin-macchiato'

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
-- use <C-f> or q: to list down the command history in command mode
