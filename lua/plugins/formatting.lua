return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          python = { "black" },
          rust = { "rustfmt", lsp_format = "fallback" },
          go = { "goimports" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        },
      })

      local async_filetypes = {
        python = true,
        -- Add more: e.g., javascript = true,
      }

      vim.keymap.set("n", "<leader>f", conform.format)

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          local is_async = async_filetypes[vim.bo.filetype] or false
          if not conform.format({ async = is_async }) then
            vim.lsp.buf.format({ bufnr = args.buf })
          end
        end,
      })
    end,
  },
}
