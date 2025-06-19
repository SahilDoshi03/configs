vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false

local home_dir = os.getenv("USERPROFILE") or os.getenv("HOME")
if home_dir then
  -- Use the appropriate path separator based on the operating system
  local path_separator = package.config:sub(1, 1) -- Get the correct path separator
  vim.opt.undodir = home_dir .. path_separator .. ".vim" .. path_separator .. "undodir"
else
  print("Warning: HOME or USERPROFILE environment variable is not set.")
end

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
