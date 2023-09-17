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
                  notes = "~/notes",
                },
                default_workspace = "notes",
              },
            },
          },
        },
      },
      {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {},
        event = "VeryLazy",
        keys = {{
          "<leader>vs", "<cmd>:VenvSelect<cr>",
          "<leader>vc", "<cmd>:VenvSelectCached<cr>"
        }}
      },
    },
  }

return config
