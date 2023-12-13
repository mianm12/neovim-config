-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 在Makefile中使用tabs
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "make" },
  callback = function()
    vim.bo.expandtab = false -- 使用跳格(tabs)代替空格(spaces)
  end,
})