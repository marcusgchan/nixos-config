vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

local configs = require("nvim-treesitter.configs")

configs.setup({
  highlight = { enable = true },
  indent = { enable = true },
})
