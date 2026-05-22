return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("notify").setup({
      background_colour = "#000000",
    })
    require("noice").setup({
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    })
    require("telescope").load_extension("noice")
    vim.keymap.set("n", "<leader>nh", ":Noice history<CR>")
    vim.keymap.set("n", "<leader>nd", ":Noice dismiss<CR>")
  end,
}
