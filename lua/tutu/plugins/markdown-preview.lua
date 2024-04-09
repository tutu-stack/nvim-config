-- 第一次安装需要再buffer中执行 :call mkdp#util#install
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && pnpm install",
  lazy = true,
  ft = { "markdown" },
  keys = { { ",mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview Toggle" } },
  config = function()
    vim.g.mkdp_auto_close = true
    vim.g.mkdp_open_to_the_world = false
    vim.g.mkdp_open_ip = "127.0.0.1"
    vim.g.mkdp_port = "8888"
    vim.g.mkdp_browser = ""
    vim.g.mkdp_echo_preview_url = true
    vim.g.mkdp_page_title = "${name}"
  end,
  --enabled = true,
  --init = function()
  --  vim.notify('hello', 1)
  --  vim.g.mkdp_filetypes = { "markdown" }
  --  --vim.g.mkdp_browser = "/Applications/Google Chrome.app"
  --  vim.g.mkdp_browser = "Google Chrome"
  --  vim.cmd [[
  --    function OpenMarkdownPreview (url)
  --      execute "silent ! open -a Google\ Chrome -n --args --new-window " . a:url
  --    endfunction
  --    let g:mkdp_browserfunc = 'OpenMarkdownPreview'
  --  ]]
  --end,
}
