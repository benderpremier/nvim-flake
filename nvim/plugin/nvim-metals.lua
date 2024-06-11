local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({
        metalsBinaryPath = vim.api.nvim_get_var('nix_dependant_configs').metals_path
    })
  end,
  group = nvim_metals_group,
})