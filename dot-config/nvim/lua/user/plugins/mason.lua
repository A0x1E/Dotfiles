--
-- Portable package manager for NeoVim with plugins
--

return {

  -- [AstroNvim] install LSP-servers
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua_ls",

        "bashls",

        "dockerls",
        "docker_compose_language_server",

        "rust_analyzer",
        "taplo",

        "pylyzer",
        "ruff"
      })
    end
  },

  -- [AstroNvim] install Formatters/Linters
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "stylua"
      })
    end
  },

  -- [AstroNvim] install DAP
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "debugpy",
      })
    end
  }
}
