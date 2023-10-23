return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },
  config = function (  )
    require("bufferline").setup {}

    local keymap = vim.keymap -- for conciseness
    local opt = { silent = true }

    keymap.set("n", "<C-[>", "<Cmd>BufferLineMovePrev<CR>", opt)
    keymap.set("n", "<C-]>", "<Cmd>BufferLineMoveNext<CR>", opt)

    keymap.set("n", "gbl", "<cmd>BufferLineCloseRight<CR>", opt)
    keymap.set("n", "gbh", "<cmd>BufferLineCloseLeft<CR>", opt)
    keymap.set("n", "gbs", "<cmd>BufferLineSortByTabs<CR>", opt)
    keymap.set("n", "gbo", "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>", opt)
    keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", opt)
    keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", opt)
    keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", opt)
    keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", opt)
    keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", opt)
    keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", opt)
    keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", opt)
    keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", opt)
    keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", opt)
    keymap.set("n", "<leader>0", "<cmd>BufferLineGoToBuffer 10<CR>", opt)
    keymap.set("n", "<leader>+", "<cmd>BufferLineCycleNext<CR>", opt)
    keymap.set("n", "<leader>-", "<cmd>BufferLineCyclePrev<CR>", opt)
  end
}