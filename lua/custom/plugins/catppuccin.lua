return {
  "catppuccin/nvim",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
	solid = false,
      },
    })

    vim.cmd.colorscheme "catppuccin"
  end,
}
