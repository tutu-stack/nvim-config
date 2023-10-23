function mysplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

local function projectDir()
  local arr = mysplit(vim.fn.getcwd(), "/")
  return arr[#arr]
end

local colors = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  red = "#FF4A4A",
  fg = "#c3ccdc",
  bg = "#112638",
  inactive_bg = "#2c3043",
}
local my_lualine_theme = {
  normal = {
    a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  visual = {
    a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  command = {
    a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = "bold" },
    b = { bg = colors.bg, fg = colors.fg },
    c = { bg = colors.bg, fg = colors.fg },
  },
  inactive = {
    a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
    b = { bg = colors.inactive_bg, fg = colors.semilightgray },
    c = { bg = colors.inactive_bg, fg = colors.semilightgray },
  },
}

local theme = {
  light = function()
    --local theme = os.getenv "TERM" == "xterm-256color" and "ayu_mirage" or "gruvbox_light"
    return {
      options = {
        --theme = theme,
        theme = "gruvbox_light",
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = "" },
      },
      extensions = { "nvim-tree", "toggleterm" },
      sections = {
        lualine_a = {
          { "mode" },
          { projectDir },
        },
        lualine_c = {
          --"filename",
          {
            "filename",
            file_status = true,
            path = 1,
            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
            },
          },
          {
            "lsp_progress",
            spinner_symbols = { " ", " ", " ", " ", " ", " " },
          },
        },
        lualine_x = {
          {
            "tabs",
            max_length = vim.o.columns / 3, -- Maximum width of tabs component.
            mode = 0,
          },
          "filesize",
          {
            "fileformat",
          },
          "encoding",
        },
      },
    }
  end,
  dark = function()
    local lazy_status = require "lazy.status" -- to configure lazy pending updates count

    -- configure lualine with modified theme
    return {
      options = {
        theme = my_lualine_theme,
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    }
  end,
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  theme = theme,
  config = function()
    local lualine = require "lualine"

    lualine.setup(theme.light())
  end,
}
