return {
  "f-person/git-blame.nvim",
  config = function()
    vim.g.gitblame_enabled = 1
    vim.g.gitblame_message_template = "<summary> • <date> • <author>"
    vim.g.gitblame_highlight_group = "LineNr" -- Question, LineNr
    --vim.g.gitblame_set_extmark_options = { priority = 7 }
    --vim.g.gitblame_date_format = '%r'
    vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
    --local git_blame = require "gitblame"

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>gt", "<cmd>GitBlameToggle<CR>", { desc = "Toggle git-blame.nvim" }) -- toggle file explorer
  end,
}
