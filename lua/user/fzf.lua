local status_ok, fzflua = pcall(require, "fzf-lua")
if not status_ok then
  return
end

fzflua.setup({
  winopts = {
    split = "belowright new",
    preview = {
      -- 	wrap = "nowrap", -- wrap|nowrap
      -- 	hidden = "nohidden", -- hidden|nohidden
      vertical = "up:40%", -- up|down:size
      layout = "vertical", -- horizontal|vertical|flex
    },
    on_create = function()
      local opts = { silent = true, noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<C-n>", "<Down>", opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-p>", "<Up>", opts)
    end,
  },
})
