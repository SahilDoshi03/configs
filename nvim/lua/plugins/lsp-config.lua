return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "jsonls", "graphql",
          "pylsp",
          "gopls",
          "cssls",
          "sqlls"
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.pylsp.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.cssls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.sqlls.setup({ capabilities = capabilities, on_attach = on_attach })
    end,
  }
}
