local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gw", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "gW", function() vim.diagnostic.goto_prev() end, opts)
  end
})

return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",   -- only load on lua files
        opts = {
          library = { -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('lspconfig').lua_ls.setup { capabilities = capabilities }
      require('lspconfig').rust_analyzer.setup { capabilities = capabilities }
      require('lspconfig').ts_ls.setup { capabilities = capabilities }
      require('lspconfig').gopls.setup { capabilities = capabilities }
      require('lspconfig').cssls.setup { capabilities = capabilities }
      require('lspconfig').html.setup { capabilities = capabilities }
      require('lspconfig').emmet_language_server.setup { capabilities = capabilities }
      require('lspconfig').ocamllsp.setup { capabilities = capabilities }
      require('lspconfig').basedpyright.setup { capabilities = capabilities }
      require('lspconfig').jsonls.setup { capabilities = capabilities }
      require('lspconfig').ccls.setup { capabilities = capabilities }
    end,
  }
}
