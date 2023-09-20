--
-- Helper version manager for Cargo-crates
--

return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('crates').setup()
  end
}
