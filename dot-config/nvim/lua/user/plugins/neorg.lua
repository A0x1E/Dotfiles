--
-- Life Organization tool
--

return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = {"nvim-lua/plenary.nvim"},
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.keybinds"] = {}, -- Adds default keybinds
      ["core.journal"] = {}, -- Enables support for the journal module
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes"
          },
          default_workspace = "notes",
        }
      }
    }
  }
}
