local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    python = { "isort", "black" },
    c = { "clang_format" },
    go = { "gofumpt" }, templ = function(buf)
      return { "templ" }
    end,
  },
  format_on_save = {
    lsp_fallback = true,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>fd", function()
  conform.format({
    async = true,
    lsp_fallback = true,
  })
end)
