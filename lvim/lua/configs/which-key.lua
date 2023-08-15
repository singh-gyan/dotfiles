---@diagnostic disable: undefined-global
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}


local mappings = {
  ["/"] = { ":noh<CR>", "highlight" },
  ["D"] = {
    name = "+Diffview",
    c = { "<cmd>DiffviewClose<cr>", "close" },
    f = { "<cmd>DiffviewFileHistory %<cr>", "file" },
    o = { "<cmd>DiffviewOpen<cr>", "open/merge" },
    r = { "<cmd>DiffviewRefresh<cr>", "file" },
    t = { "<cmd>DiffviewToggleFiles<cr>", "toggle" },
  },
  -- ["r"] = { ":NoiceDismiss<cr>", "Noice Dismiss" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  -- ["x"] = { "<cmd>BufferKill<cr>", "Close Buffer" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  n = {
    name = "+Neorg",
    n = { "<cmd>Neorg index<cr>", "Index" },
    r = { "<cmd>Neorg return<cr>", "Return" },
    p = { "<cmd>Neorg workspace personal<cr>", "Personal" },
    w = { "<cmd>Neorg workspace work<cr>", "Work" },
  },
  -- L = { "<cmd>Lazy<cr>", "Lazy" },
  ["s"] = {
    name = "+Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    B = { "<cmd>Telescope builtin<cr>", "Builtins" },
    C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    e = { "<cmd>Telescope file_browser<cr>", "File Browse" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>TodoTelescope<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    f = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
    },
    s = { "<cmd>Telescope resume<cr>", "Resume Search" },
    w = {
      "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.expand('<cword>') })<cr>",
      "Search Word Under Cursor",
    },
    y = { "<cmd>Telescope yank_history<cr>", "YankHistory" },
  },
  ["S"] = {
    name = "+Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  },
  ["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  },
  u = { "<cmd>UndotreeToggle<cr>", "UndoTree" },

  ["<Leader>"] = {
    p = { ":lua RemoveLineBreaks()<CR>p", "paste after cursor" },
    P = { ":lua RemoveLineBreaks()<CR>P", "paste before cursor" },

    d = {
      "+Delete Inner",

      ['"'] = { 'di"', '"' },
      ["'"] = { "di'", "'" },
      ['t'] = { 'dit', 't' },
    },
    D = {
      "+Delete Outer",

      ['"'] = { 'da"', '"' },
      ["'"] = { "da'", "'" },
      ['t'] = { 'dat', 't' },
    }
  }
}

for k, v in pairs(mappings) do
  -- vim.opt[k] = v
  lvim.builtin.which_key.mappings[k] = v
end
