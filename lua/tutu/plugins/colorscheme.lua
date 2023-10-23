return {
  -- add gruvbox
  --{ "ellisonleao/gruvbox.nvim" },
  -- Configure LazyVim to load gruvbox
  --{ "marko-cerovac/material.nvim" },
  { "lifepillar/vim-solarized8" },
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      --vim.cmd [[colorscheme nightfly]]
      vim.cmd([[colorscheme solarized8]])

      local keymap = vim.keymap -- for conciseness
      local opts = { noremap = true, silent = true }

      keymap.set("n", "<leader>m1", function()
        vim.cmd [[
          colorscheme solarized8_flat
          set background=light
        ]]
        require("lualine").setup(require("tutu.plugins.lualine").theme.light())
      end, opts) -- show lsp type definitions
      keymap.set("n", "<leader>m2", function()
        vim.cmd [[
          colorscheme nightfly
        ]]
        require("lualine").setup(require("tutu.plugins.lualine").theme.dark())
      end, opts) -- show lsp type definitions
    end,
  },
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     local bg = "#011628"
  --     local bg_dark = "#011423"
  --     local bg_highlight = "#143652"
  --     local bg_search = "#0A64AC"
  --     local bg_visual = "#275378"
  --     local fg = "#CBE0F0"
  --     local fg_dark = "#B4D0E9"
  --     local fg_gutter = "#627E97"
  --     local border = "#547998"
  --
  --     require("tokyonight").setup({
  --       style = "night",
  --       on_colors = function(colors)
  --         colors.bg = bg
  --         colors.bg_dark = bg_dark
  --         colors.bg_float = bg_dark
  --         colors.bg_highlight = bg_highlight
  --         colors.bg_popup = bg_dark
  --         colors.bg_search = bg_search
  --         colors.bg_sidebar = bg_dark
  --         colors.bg_statusline = bg_dark
  --         colors.bg_visual = bg_visual
  --         colors.border = border
  --         colors.fg = fg
  --         colors.fg_dark = fg_dark
  --         colors.fg_float = fg
  --         colors.fg_gutter = fg_gutter
  --         colors.fg_sidebar = fg_dark
  --       end,
  --     })
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },
}
