local config = {
    colorscheme = "gruvbox-material",
    lsp = { servers = { "rust_analyzer", "pyright", "lua_ls" } },
    mappings = {
      n = {
        ["<leader>c"] = {
          function()
            local bufs = vim.fn.getbufinfo { buflisted = true }
            require("astronvim.utils.buffer").close(0)
            if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
          end,
          desc = "Close buffer",
        },
      },
    },
    plugins = {
      { "sainnhe/gruvbox-material" },
      {
        "goolord/alpha-nvim",
        opts = function(_, opts)
          opts.section.header.val = {
            " █████╗  ██████╗ ██╗  ██╗ ██╗███████╗",
            "██╔══██╗██╔═████╗╚██╗██╔╝███║██╔════╝",
            "███████║██║██╔██║ ╚███╔╝ ╚██║█████╗",
            "██╔══██║████╔╝██║ ██╔██╗  ██║██╔══╝",
            "██║  ██║╚██████╔╝██╔╝ ██╗ ██║███████╗",
            "╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝ ╚═╝╚══════╝",
            "████████████████████████████████████╗",
            "╚═══════════════════════════════════╝",
            "  ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            "  ████╗  ██║██║   ██║██║████╗ ████║",
            "  ██╔██╗ ██║██║   ██║██║██╔████╔██║",
            "  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "  ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "  ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
          }
        end,
      },
      {
        "nvim-neorg/neorg",
        config = function()
          require("neorg").setup {
            load = {
              ["core.defaults"] = {}, -- Loads default behaviour
              ["core.concealer"] = {}, -- Adds pretty icons to your documents
              ["core.dirman"] = { -- Manages Neorg workspaces
                config = {
                  workspaces = {
                    notes = "~/notes",
                  },
                },
                run = ":Neorg sync-parsers",
                requires = "nvim-lua/plenary.nvim",
              },
            },
          }
        end,
      },
    },
  }
  
  return config
  