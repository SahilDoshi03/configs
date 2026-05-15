return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = { enabled = true, leave_dirs_open = false },
        },
        commands = {
          diff_view = function(state)
            local node = state.tree:get_node()
            vim.cmd("DiffviewOpen -- " .. node.path)
          end
        },
        git_status = {
          window = {
            mappings = {
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
              ["<CR>"] = "diff_view",
            }
          }
        }
      })

      vim.keymap.set("n", "<leader>tr", ":Neotree filesystem reveal left<CR>")
    end,
  },
}
