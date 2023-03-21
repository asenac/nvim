require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }
    }
  }
}


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>as', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ad', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>M', builtin.resume, {})
vim.keymap.set('n', '<leader>ag', builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

local telescope = require('telescope')
telescope.load_extension('lsp_handlers')
telescope.load_extension('project')
telescope.load_extension("ui-select")

local project = require'telescope'.extensions.project
vim.keymap.set('n', '<leader>ao', project.project, {})

