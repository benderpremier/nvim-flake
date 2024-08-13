if vim.g.did_load_neotree_plugin then
  return
end
vim.g.did_load_neotree_plugin = true

require("neo-tree").setup({
})
vim.keymap.set("n", "<leader>fe", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<leader>be", ":Neotree buffers reveal float<CR>", {})
vim.keymap.set("n", "<leader>ge", ":Neotree float git_status<CR>", {})
