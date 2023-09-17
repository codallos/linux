local builtin = require('telescope.builtin')
require('telescope').setup{
  defaults = { file_ignore_patterns = {
    "./node_modules/*","node_modules","^node_modules/*", "node_modules/*"
  } }
}
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags,{})
