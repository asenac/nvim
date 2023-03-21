vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("asenac.remap")
require("asenac.plugins")

vim.wo.number = true
vim.wo.wrap = false

vim.cmd([[colorscheme gruvbox]])
