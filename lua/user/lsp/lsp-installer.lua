local status_ok = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local status_lspconfig_ok, lspconfig = pcall(require, "lspconfig")
if not status_lspconfig_ok then
	return
end

local opts = {
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = require("user.lsp.handlers").capabilities,
}

-- Explicity register each lsp server
-- Install each lsp server using `npm i -g <lsp server package name`

-- Exceptions:
-- Lua LS - `brew install lua-language-server`
-- Eslint - `npm i -g vscode-langservers-extracted`

local cssls_opts = require("user.lsp.settings.cssls")
cssls_opts = vim.tbl_deep_extend("force", cssls_opts, opts)
lspconfig.cssls.setup(cssls_opts)

local emmet_ls_opts = require("user.lsp.settings.emmet_ls")
emmet_ls_opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
lspconfig.emmet_ls.setup(emmet_ls_opts)

local html_opts = require("user.lsp.settings.html")
html_opts = vim.tbl_deep_extend("force", html_opts, opts)
lspconfig.html.setup(html_opts)

local jsonls_opts = require("user.lsp.settings.jsonls")
jsonls_opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
lspconfig.jsonls.setup(jsonls_opts)

local lua_ls_opts = require("user.lsp.settings.lua_ls")
lua_ls_opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
lspconfig.lua_ls.setup(lua_ls_opts)

local pyright_opts = require("user.lsp.settings.pyright")
pyright_opts = vim.tbl_deep_extend("force", pyright_opts, opts)
lspconfig.pyright.setup(pyright_opts)

lspconfig.cssmodules_ls.setup(opts)
lspconfig.eslint.setup(opts)
lspconfig.graphql.setup(opts)
lspconfig.tailwindcss.setup(opts)
lspconfig.tsserver.setup(opts)

