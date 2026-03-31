return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local bindings = {
      ["<CR>"] = { api.node.open.edit, "Open file/folder" },
      ["h"]    = { api.node.navigate.parent_node, "Go to parent directory" },
      ["j"]    = { api.node.navigate.next, "Next item" },
      ["k"]    = { api.node.navigate.prev, "Previous item" },
      ["a"]    = { api.fs.create, "Create file/folder" },
      ["d"]    = { api.fs.remove, "Delete" },
      ["r"]    = { api.fs.rename, "Rename" },
      ["y"]    = { api.fs.copy.node, "Copy" },
      ["p"]    = { api.fs.paste, "Paste" },
      ["f"]    = { api.fs.copy.absolute_path, "Copy filename" },
      ["?"]    = { api.tree.toggle_help, "Help" },
    }

    for key, def in pairs(bindings) do
      local func, desc = def[1], def[2]
      if func then
        vim.keymap.set("n", key, func, {
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
          desc = "NvimTree: " .. desc,
        })
      end
    end
  end

  require("nvim-tree").setup({
    on_attach = on_attach,
    view = { width = 32 },
    update_focused_file = {
      enable = true,
    },
  })

  -- NOW it's safe to use the API
  local api = require("nvim-tree.api")
  vim.keymap.set("n", "<leader>e", api.tree.toggle, {
    desc = "Toggle file tree",
  })
end
}

