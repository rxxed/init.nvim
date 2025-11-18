vim.keymap.set('n', '<leader>.', function()
  local parent = vim.fn.expand('%:p:h')
  vim.cmd('split | terminal cd ' .. parent .. ' && lf')
  vim.cmd('startinsert')
end, { silent = true })

-- auto-close the terminal buffer when the job finishes
vim.api.nvim_create_autocmd('TermClose', {
  pattern = '*',      -- any terminal buffer
  command = 'close!', -- or 'bdelete!' if you prefer
})

return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
    },
    lazy = false,
    config = function()
      require('oil').setup({
        default_file_explorer = true,
        columns = {
          'icon',
        },
        watch_for_changes = true,
      })
    end
  }
}
