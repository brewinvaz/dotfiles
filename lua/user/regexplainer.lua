local status_ok, regexplainer = pcall(require, "regexplainer")
if not status_ok then
  return
end

regexplainer.setup {
  mode = 'narrative', -- TODO: 'ascii', 'graphical'

  -- automatically show the explainer when the cursor enters a regexp
  auto = true,

  -- Whether to log debug messages
  debug = false, 

  mappings = {
    show = 'gR',
  },

  narrative = {
    separator = '\n',
  },
}

regexplainer.show {
  display = 'popup',
  popup = {
    border = {
      padding = { 1, 1 },
      style = 'solid',
    },
  },
}
