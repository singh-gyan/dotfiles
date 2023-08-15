local ts = vim.treesitter
local ts_utils = require 'nvim-treesitter.ts_utils'
local parsers = require("nvim-treesitter.parsers")

local ps = parsers.get_parser();
local tree = ps:parse()[1];
local root = tree:root()
print(ts.get_node_text(root, 0))
