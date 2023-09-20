local config = {
  colorscheme = "gruvbox-material",
  lsp = { servers = { "rust_analyzer", "pyright", "lua_ls" } },
  options = {
    g = {
      icons_enabled = false,
    }
  }
}

return config
