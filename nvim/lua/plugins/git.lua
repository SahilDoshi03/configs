return {
  -- Fugitive
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gdiffsplit" },
    keys = {
      { "<leader>gs", ":G<CR>", desc = "Git Status" },
    },
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" }, -- Load as soon as a file opens
    opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 0,
      },
    },
    keys = {
      { "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Git Blame" },
    },
  },
}
