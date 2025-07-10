local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader><leader>', builtin.find_files)
vim.keymap.set('n', '<leader>bb', builtin.buffers)
vim.keymap.set('n', '<leader>hh', builtin.help_tags)
vim.keymap.set('n', '<leader>hm', builtin.man_pages)
vim.keymap.set('n', '<leader>ht', builtin.colorscheme)
vim.keymap.set('n', '<leader>vo', builtin.vim_options)
vim.keymap.set('n', '<leader>gc', builtin.git_commits)
vim.keymap.set('n', '<leader>/', builtin.live_grep)
vim.keymap.set('n', '<leader>:', builtin.commands)

local function pathpicker(path)
  return function() builtin.find_files { cwd = path } end
end

vim.keymap.set('n', '<leader>sn', pathpicker(vim.fn.stdpath 'config'))
vim.keymap.set( 'n', '<leader>ob', pathpicker(require('constants').obsidian_vault_path))

return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      defaults = require('telescope.themes').get_ivy{},
    }
  end
}
