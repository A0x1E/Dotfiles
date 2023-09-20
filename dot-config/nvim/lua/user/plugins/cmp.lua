--
-- [AstroNvim] A completion engine
--

return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.sources = cmp.config.sources {
      { name = "crates" }
    }
    return opts
  end
}
