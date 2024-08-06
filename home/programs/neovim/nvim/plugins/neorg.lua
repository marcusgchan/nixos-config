require("neorg").setup ({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.dirman"] = {
      config = {
        workspaces = {
          bible = "~/notes/bible",
          cs = "~/notes/cs",
        },
        -- default_workspace = "notes",
      },
    },
  },
})
