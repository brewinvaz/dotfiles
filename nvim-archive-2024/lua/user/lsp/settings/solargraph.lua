local status_ok, lsp_config = pcall(require, "lspconfig")
if not status_ok then
  return
end

return {
  filetypes = { "ruby" },
  flags = {
    debounce_text_changes = 150,
  },
  root_dir = lsp_config.util.root_pattern("Gemfile", ".git"),
}
