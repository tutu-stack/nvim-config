return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"

    telescope.setup {
      defaults = {
        path_display = { "truncate " },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-h>"] = actions.close,
          },
          n = {
            ["q"] = actions.close,
            ["l"] = actions.file_edit,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--ignore-file",
          ".gitignore",
        },
        file_ignore_patterns = {
          "./node_modules",
        },
        bookmarks = {
          -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
          selected_browser = "google_chrome",

          -- Either provide a shell command to open the URL
          url_open_command = "open",

          -- Or provide the plugin name which is already installed
          -- Available: 'vim_external', 'open_browser'
          url_open_plugin = nil,
          firefox_profile_name = nil,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        -- fzy_native = {
        --   override_generic_sorter = false,
        --   override_file_sorter = true,
        --   case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        --   -- the default case_mode is "smart_case"
        -- },
        -- bookmarks = {
        --   -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
        --   selected_browser = 'brave',
        --
        --   -- Either provide a shell command to open the URL
        --   url_open_command = 'open',
        --
        --   -- Or provide the plugin name which is already installed
        --   -- Available: 'vim_external', 'open_browser'
        --   url_open_plugin = nil,
        --   firefox_profile_name = nil,
        -- },
      },
    }

    telescope.load_extension "fzf"
    -- telescope.load_extension("fzy_native")
    -- telescope.load_extension('bookmarks')
    -- telescope.load_extension "vim_bookmarks"
    -- telescope.load_extension "notify"
    -- telescope.load_extension "file_browser"

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local map = vim.api.nvim_set_keymap
    --local bmap = vim.api.nvim_buf_set_keymap
    -- 复用 opt 参数
    local opts = { noremap = true, silent = true }
    opts.desc = "Go to declaration"
    keymap.set("n", "<leader>d", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", opts)
    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
    opts.desc = "Show LSP implementations"
    keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    opts.desc = "Show LSP references"
    keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)
    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>", opts)
    -- keymap.set('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    keymap.set("n", "<leader>q", "<cmd>Telescope diagnostics<CR>", opts)

    keymap.set("n", ";ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", ";fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", ";fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", ";fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set(
      "n",
      ";fa",
      "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files,-g=!node_modules,-g=!.git,-g=!.DS_Store prompt_prefix=🔍<CR>",
      { desc = "Fuzzy find all files in cwd" }
    )
  end,
}
