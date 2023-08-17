-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,           opts('Help'))
  vim.keymap.set('n', 'l',     api.node.open.edit,             opts('Open'))
  vim.keymap.set('n', 'h',     api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical,         opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal,       opts('Open: Horizontal Split'))
end

-- following options are being migrated to the setup function incrementally
-- please check https://github.com/kyazdani42/nvim-tree.lua/blob/master/README.md
vim.g.git_hl = 1
vim.g.root_folder_modifier = ":t"
vim.g.show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
  tree_width = 30,
}

nvim_tree.setup({
  on_attach = on_attach,
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 35,
    hide_root_folder = false,
    side = "left",
    number = true,
    relativenumber = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  renderer = {
    group_empty = true,
    full_name = true,
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      }
    }
  }
})
