return {
  -- Fugitive
  {
    "tpope/vim-fugitive",
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
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
      { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diffview Tab" },
    },
    opts = function()
      -- We import the actions module here so we can use its functions
      local actions = require("diffview.actions")

      return {
        enhanced_diff_hl = true,
        use_icons = true,
        keymaps = {
          file_panel = {
            -- We use the actual function from the actions module
            { "n", "s", actions.toggle_stage_entry, { desc = "Stage/unstage file" } },
          },
          view = {
            -- Same here for the code window
            { "n", "s", actions.toggle_stage_entry, { desc = "Stage/unstage hunk" } },
          },
        },
      }
    end,
  }
}
