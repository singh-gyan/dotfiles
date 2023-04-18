--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = false
vim.opt.showcmd = true
vim.opt.acd = false
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.cpoptions = "aABceFsn_"
-- general
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = "*.lua", --Add more file types to format on save
	timeout = 1000,
}

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>

lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.visual_mode["kj"] = "<ESC>"
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
lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<CR>"
lvim.keys.normal_mode["<leader>bj"] = ':lua require("harpoon.ui").nav_next()<CR>'
lvim.keys.normal_mode["<leader>bk"] = ':lua require("harpoon.ui").nav_prev()<CR>'
lvim.keys.normal_mode["<leader>bt"] = ':lua require("harpoon.ui").toggle_quick_menu()<CR>'
lvim.keys.normal_mode["<leader>ba"] = ':lua require("harpoon.ui").toggle_quick_menu()<CR>'
-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "gruvbox-material"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.git.ignore = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.builtin.treesitter.indent.enable = true
-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
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

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "scss" },
	},
})

lvim.builtin.treesitter.textobjects = {
	move = {
		enable = true,
		set_jumps = true, -- whether to set jumps in the jumplist
		goto_next_start = {
			["]m"] = "@function.outer",
			["]]"] = { query = "@class.outer", desc = "Next class start" },
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
			["]["] = "@class.outer",
		},
		goto_previous_start = {
			["[m"] = "@function.outer",
			["[["] = "@class.outer",
		},
		goto_previous_end = {
			["[M"] = "@function.outer",
			["[]"] = "@class.outer",
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

lvim.builtin.telescope.pickers.find_files.theme = "ivy"
lvim.builtin.telescope.pickers.find_files.find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }

--Bufferline Tab
lvim.builtin.bufferline.options.separator_style = "slant"

--Terminal Config
lvim.builtin["terminal"].direction = "tab"
lvim.builtin["terminal"].exces = {
	{ nil, "<M-1>", "Tab Terminal", "tab", 0.3 },
	{ nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
	{ nil, "<M-3>", "Float Terminal", "float", nil },
}

--Override Lualine config
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_x = { "filetype" }
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end
local colors = require("lvim.core.lualine.colors")
local git_blame = require("gitblame")
lvim.builtin.lualine.sections.lualine_c = {
	{
		"diff",
		source = diff_source,
		symbols = {
			added = lvim.icons.git.LineAdded .. " ",
			modified = lvim.icons.git.LineModified .. " ",
			removed = lvim.icons.git.LineRemoved .. " ",
		},
		padding = { left = 2, right = 1 },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		cond = nil,
	},
	{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }, --Added Git blame to the middle of lualine
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

lvim.builtin.treesitter.autotag = {
	enable = true,
}

lvim.builtin.nvimtree.setup.actions.change_dir.enable = false

require("lspconfig").tsserver.setup({
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
	},
})

function copy_diagnostic_to_clipboard()
	local vim = vim
	local diagnostics = vim.diagnostic.get(0)
	local current_line = vim.fn.line(".")
	local current_file = vim.fn.expand("%:p")

	local lines = {}
	for _, diagnostic in ipairs(diagnostics) do
		-- if diagnostic.lnum == current_line and diagnostic.col <= vim.fn.col(".") then
		table.insert(lines, string.format("%s", diagnostic.message))
		-- end
	end
	if #lines > 0 then
		local loclist = vim.lsp.util.locations_to_items(lines)
		vim.lsp.util.set_loclist({ items = loclist, copytext = table.concat(lines, "\n") })
		vim.cmd("echo 'Copied diagnostic to clipboard'")
	else
		vim.cmd("echo 'No diagnostics found'")
	end
end

lvim.keys.normal_mode["<Leader>cy"] = ":lua copy_diagnostic_to_clipboard()<CR>"
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup [ --   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- ]

-- require("nvim-ts-autotag").setup()
-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
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
		"andymass/vim-matchup",
		event = "CursorMoved",
		config = function()
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	},
	{ "sainnhe/gruvbox-material" },
	{
		"tpope/vim-surround",
	},
	{
		"f-person/git-blame.nvim",
		event = "BufRead",
		config = function()
			vim.cmd("highlight default link gitblame SpecialComment")
			vim.g.gitblame_enabled = 1
			vim.g.gitblame_message_when_not_committed = "  Uncommited Changes"
			vim.g.gitblame_date_format = "%r"
		end,
	},
	{ "codota/tabnine-nvim", run = "./dl_binaries.sh" },
	{ "terryma/vim-multiple-cursors" },
	{ "windwp/nvim-ts-autotag" },
	{ "ethanholz/nvim-lastplace" },
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup()
		end,
	},
	{
		"ThePrimeagen/harpoon",
	},
	{
		"mbbill/undotree",
	},
}
-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
