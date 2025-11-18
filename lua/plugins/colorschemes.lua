local function theme_config() return function() vim.cmd.colorscheme("gruvbox") end end

return {
  {
    "Shatur/neovim-ayu",
    config = theme_config()
  },
  {
    "nanotech/jellybeans.vim",
    config = theme_config()
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = theme_config()
  },
  {
    "shaunsingh/nord.nvim",
    config = theme_config()
  }
}
