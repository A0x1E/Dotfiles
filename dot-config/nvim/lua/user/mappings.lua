return {
  n = {
    --
    -- Close current buffer
    --
    ["<leader>c"] = {
      function()
        local bufs = vim.fn.getbufinfo { buflistened = true }
        require("astronvim.utils.buffer").close(0)
        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
          require("alpha").start(true)
        end
      end,
      desc = "Close buffer",
    },


    --
    -- Select Venv python
    --
    ["<leader>v"] = {
      "<cmd>:VenvSelect<cr>",
      desc = "Python Venv",
    }

  }
}
