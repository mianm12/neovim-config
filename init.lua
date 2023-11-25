-- to dermine if Neovim is running in VSCode
if vim.env.VSCODE then
  vim.g.vscode = true
end

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
