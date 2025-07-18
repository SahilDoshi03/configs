return {
  's1n7ax/nvim-search-and-replace',
  config = function()
    require('nvim-search-and-replace').setup({
      -- File patterns to ignore
      ignore = {
        '**/node_modules/**',
        '**/.git/**',
        '**/.gitignore',
        '**/.gitmodules',
        'build/**',
      },

      -- Save changes automatically after replace
      update_changes = false,

      -- Keymaps
      replace_keymap = '<leader>gr',
      replace_all_keymap = '<leader>gR',
      replace_and_save_keymap = '<leader>gu',
      replace_all_and_save_keymap = '<leader>gU',
    })
  end,
}

