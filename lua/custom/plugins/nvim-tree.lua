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

    local api = require("nvim-tree.api")

    -- SAFELY resolve parent navigation
    local parent_fn = api.node.navigate.parent
      or api.node.navigate.parent_node
      or api.node.navigate.parent_close   -- fallback
      or nil

    -- Minimal keybindings with descriptions
    local bindings = {
      ["<CR>"] = { api.node.open.edit,        "Open file/folder" },

      ["h"]    = { api.node.navigate.parent_node, "Go to parent directory" },
      ["j"]    = { api.node.navigate.next,    "Next item" },
      ["k"]    = { api.node.navigate.prev,    "Previous item" },

      ["a"]    = { api.fs.create,             "Create file/folder" },
      ["d"]    = { api.fs.remove,             "Delete" },
      ["r"]    = { api.fs.rename,             "Rename" },
      ["y"]    = { api.fs.copy.node,          "Copy" },
      ["p"]    = { api.fs.paste,          "Copy" },

      ["f"]    = { api.fs.copy.absolute_path,      "Copy filename" },

      ["?"]    = { api.tree.toggle_help,      "Help" },
    }

    local function setup_bindings(bufnr)
      for key, def in pairs(bindings) do
        local func, desc = def[1], def[2]

        -- Skip any nil function so it never errors
        if func ~= nil then
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

    local function on_attach(bufnr)
      setup_bindings(bufnr)
    end

    require("nvim-tree").setup({
      on_attach = on_attach,
      view = { width = 32 },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
    })

    vim.keymap.set("n", "<leader>e", api.tree.toggle, {
      desc = "Toggle file tree",
    })
  end,
}

