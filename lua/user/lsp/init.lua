local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.settings.metals")
require("user.lsp.lsp-installer")
require("user.lsp.mason-lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("aerial").setup()
