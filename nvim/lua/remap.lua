-- push selection up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- select entire buffer
vim.keymap.set("n", "<C-a>", "ggVG")
-- select line from content start to end
vim.keymap.set("n", "<C-l>", "^vg_")

vim.keymap.set("n", "J", "mzJ`z")

-- keep cursor in the center of the page when srolling up or down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep cursor in the center when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- replace selection without yanking the selection
vim.keymap.set("x", "<leader>p", [["_dP]])

-- delete without yankind the deletion
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- copy line to clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- avoid going to :Ex
vim.keymap.set("n", "Q", "<nop>")

-- format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigate in quickfix list
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- navigate in location list
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- global find and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- source vim
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- hide highlights
vim.keymap.set("n", "<leader>rh", ":noh<CR>")

-- resize pane
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")


-- copy the diagnostic messages (error, warnings) etc
vim.keymap.set('n', '<leader>e', function()
  local d = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
  if d[1] then
    vim.fn.setreg('+', d[1].message)
    print("Copied error to clipboard: " .. d[1].message)
  else
    print("No diagnostic on this line")
  end
end)
