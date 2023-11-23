-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.encoding = "utf-8"
opt.autoindent = true -- 自动缩进(根据上行)
opt.autowrite = true -- 开启 auto write
opt.clipboard = "unnamedplus" -- 同步系统粘贴版
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- 隐藏*标记为粗体和斜体
opt.confirm = true -- 在退出修改过的缓冲区之前要确认保存更改
opt.cursorline = true -- 开启当前行高亮
opt.expandtab = true -- 使用空格(spaces)代替跳格(tabs)
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- 忽略大小写
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
opt.list = true -- 显示一些不可见字符(比如 tabs...
opt.listchars = { tab = "> ", trail = "·", nbsp = "+", extends = "→", precedes = "←" }
opt.mouse = "a" -- 开启鼠标模式
opt.number = true -- 输出行号
opt.pumblend = 10 -- 弹出菜单
opt.pumheight = 10 -- 弹出菜单中显示的最大条目数
opt.relativenumber = true -- 相对行号
opt.scrolloff = 4 -- 保持在上方和下方的最少行数。
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
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
opt.splitright = true -- 将新窗口放在当前窗口右面
opt.tabstop = 4 -- tab键相当与空格数量
opt.termguicolors = true -- 真色支持
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- 保存交换文件并且触发 CursorHold 自动命令事件
opt.wildmode = "longest:full,full" -- 命令行补全模式
opt.winminwidth = 5 -- 最小窗口宽度
opt.wrap = false -- Disable line wrap

if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append { C = true }
end

-- Set guifont
if vim.fn.has("gui_running") then
    opt.guifont='Hack Nerd Font Mono:h11'
end

-- 修正 markdown 缩进设置
vim.g.markdown_recommended_style = 0