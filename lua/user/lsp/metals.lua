-- This is not managed by nvim lsp installer
-- Included directly in init.lua
local status_ok, metals = pcall(require, "metals")
if not status_ok then
  return
end

local metals_config = metals.bare_config()

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = {} -- add packages that should not be included in completions
}

-- The following two settings work in conjuction with each other
vim.g.metals_status = 1
metals_config.init_options.statusBarProvider = "on"

-- Enable snippet support for metals
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities.textDcoument.completion.completionItem.snippetSupport = true
-- metals_config.capabilities = capabilities
