local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

lsp.set_preferences({
    sign_icons = {
        error = '•',
        warn = '•',
        hint = '•',
        info = '•'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>qf", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gs", ":vsplit | lua vim.lsp.buf.definition()<CR>")

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end)

lsp.setup()
