-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt

opt.autoindent = true -- 自动缩进(根据上行)
opt.autowrite = true -- 开启 auto write
opt.clipboard = "unnamedplus" -- 同步系统粘贴版
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- 隐藏*标记为粗体和斜体
opt.confirm = true -- 在退出修改过的缓冲区之前要确认保存更改
opt.cursorline = true -- 开启当前行高亮
opt.encoding = "utf-8"
opt.expandtab = true -- 使用空格(spaces)代替跳格(tabs)
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- 忽略大小写
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- 显示一些不可见字符(比如 tabs...
opt.listchars = { tab = "> ", trail = "·", nbsp = "+", extends = "→", precedes = "←" }
opt.mouse = "a" -- 开启鼠标模式
opt.number = true -- 输出行号
opt.pumblend = 10 -- 弹出菜单
opt.pumheight = 10 -- 弹出菜单中显示的最大条目数
opt.relativenumber = true -- 相对行号
opt.scrolloff = 4 -- 保持在上方和下方的最少行数。
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- 环绕缩进
opt.shiftwidth = 4 -- 缩进大小
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false -- 不显示模式因为我们有了状态栏
opt.sidescrolloff = 8 -- 保持在左侧和右侧的最少列数
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- 自动插入缩进
opt.spelllang = { "en" }
opt.splitbelow = true -- 将新窗口放在当前窗口下面
opt.splitkeep = "screen"
opt.splitright = true -- 将新窗口放在当前窗口右面
opt.tabstop = 4 -- tab键相当与空格数量
opt.termguicolors = true -- 真色支持
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- 保存交换文件并且触发 CursorHold 自动命令事件
opt.virtualedit = "block" -- 允许光标在visual模式下移动到没有文本的位置
opt.wildmode = "longest:full,full" -- 命令行补全模式
opt.winminwidth = 5 -- 最小窗口宽度
opt.wrap = false -- Disable line wrap
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end

-- Folding
opt.foldlevel = 99
opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"

if vim.fn.has("nvim-0.9.0") == 1 then
  opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
else
  opt.foldmethod = "indent"
end


-- Set guifont
if vim.fn.has("gui_running") then
    opt.guifont="JetBrainsMono NFM:h10.5"
    opt.guifontwide="HarmonyOS Sans:h10.5"
end

vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"

-- 修正 markdown 缩进设置
vim.g.markdown_recommended_style = 0

-- Use the Windows clipboard from WSL
if vim.fn.has('wsl') then
    vim.g.clipboard = {
        name = "WslClipboard",
        copy = {
            ["+"] = "clip.exe",
            ["-"] = "clip.exe",
        },
        paste = {
            ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
            ["-"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
        },
        cache_enable = 0,
    }
end