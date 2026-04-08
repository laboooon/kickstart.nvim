return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    if vim.fn.has("win32") == 1 then
      if vim.fn.executable("bash") then
        vim.cmd [[let &shell = '"C:/Program Files/Git/bin/bash.exe"']]
        vim.cmd [[let &shellcmdflag = '-c']]
        vim.cmd [[let &shellquote = '']]
        vim.cmd [[let &shellxquote = '']]
        vim.cmd [[let &shellredir = '> %s 2>&1']]
        vim.cmd [[let &shellpipe = '> %s 2>&1']]
        vim.cmd [[set shellslash]]
      end
    else
      vim.o.shell = os.getenv("SHELL") or "/bin/bash"
    end

    require("toggleterm").setup({
      open_mapping = '<C-_>',
      start_in_insert = true,
      autochdir = false,
      direction = 'float',
      shell = vim.o.shell,
    })

  end,
}

