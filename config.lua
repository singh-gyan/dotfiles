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
vim.opt.wrapmargin = 2
vim.opt.showbreak = "↳"
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
lvim.keys.normal_mode["<leader>op"] = "o<ESC>p"
lvim.keys.normal_mode["<leader>Op"] = "O<ESC>p"
lvim.keys.normal_mode["<leader>o"] = "o<ESC>"
lvim.keys.normal_mode["<leader>O"] = "O<ESC>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-e>"] = ":e!<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<A-l>"] = ":BufferLineCloseRight<CR>"
lvim.keys.normal_mode["<A-h>"] = ":BufferLineCloseLeft<CR>"
lvim.keys.normal_mode["<leader>ff"] = ":Telescope find_files<CR>"
lvim.keys.normal_mode["<leader>fg"] = ":Telescope live_grep<CR>"
lvim.keys.normal_mode["<leader>p"] = ":lua vim.lsp.buf.format()<CR>"
lvim.keys.normal_mode["<C->"] = ":ToggleTerm size=40 dir=~/Desktop direction=horizontal"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
lvim.colorscheme = "gruvbox-material"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

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
lvim.builtin.lualine.sections.lualine_x = { "filetype" }
lvim.builtin.lualine.options.section_separators = { left = "", right = "" }
-- vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
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
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

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
	{
		"tzachar/cmp-tabnine",
		build = "./install.sh",
		dependencies = "hrsh7th/nvim-cmp",
		event = "InsertEnter",
	},
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
}
-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
