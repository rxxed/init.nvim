return {
  {
    'stevearc/oil.nvim',
    opts = { },
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
    },
    lazy = false,
    config = function ()
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
