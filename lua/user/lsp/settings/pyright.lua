local status_ok, util = pcall(require, "lspconfig/util")
if not status_ok then
	return
end

local path = util.path

-- local function get_python_path(workspace)
-- 	-- Use activated virtualenv.
-- 	if vim.env.VIRTUAL_ENV then
-- 		return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
-- 	end
--
-- 	-- Find and use virtualenv in workspace directory.
-- 	for _, pattern in ipairs({ "*", ".*" }) do
-- 		local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
-- 		if match ~= "" then
-- 			return path.join(path.dirname(match), "bin", "python")
-- 		end
-- 	end
--
-- Fallback to system Python.
-- 	return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
-- end

-- return {
-- 	before_init = function(_, config)
-- 		config.settings.python.pythonPath = get_python_path(config.root_dir)
-- 	end,
-- }

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(path.join(workspace, 'Pipfile'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    return path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

return {
  on_attach = function()
      require'lsp_signature'.on_attach {
          hint_enable = false,
      }
  end,
  on_init = function(client)
      client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end
}
