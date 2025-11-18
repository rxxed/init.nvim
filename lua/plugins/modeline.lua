return {
  'echasnovski/mini.statusline',
  config = function()
    local statusline = require 'mini.statusline'
    statusline.setup()
    -- statusline.setup { use_icons = vim.g.have_nerd_font }
  end
}
