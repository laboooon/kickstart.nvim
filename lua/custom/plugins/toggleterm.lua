return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    if vim.fn.has("win32") == 1 then
      vim.cmd [[let &shell = '"C:/Program Files/Git/bin/bash.exe"']]
      vim.cmd [[let &shellcmdflag = '-s']]
    end

    require("toggleterm").setup({
      open_mapping = '<C-_>',
      start_in_insert = true,
      direction = 'float',
      shell = vim.o.shell,
    })
  end,
}

