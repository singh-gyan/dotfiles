local options = {
  wrap = true,
  linebreak = true,
  breakindent = true,
  number = true,
  backup = false,
  clipboard = "unnamedplus",
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  smartcase = true, -- smart case
  ignorecase = true,
  smartindent = true,
  swapfile = false, -- creates a swapfile
  timeoutlen = 700, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 100, -- faster completion (4000ms default)
  shiftwidth = 2,   -- the number of spaces inserted for each indentation
  tabstop = 2,      -- insert 2 spaces for a tab
  numberwidth = 4,  -- set number column width to 2 {default 4}
  scrolloff = 2,    -- minimal number of screen lines to keep above and below the cursor
  foldcolumn = "1",
  fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
  laststatus = 3,
  termguicolors = true,
  cursorline = false,
  guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20"
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
