local path_exists = function(path)
  return vim.loop.fs_stat(path) and true or false
end

local check_eslint_file_exists = function()
  local cwd = vim.fn.getcwd()
  local eslint_files = { ".eslintrc", ".eslintrc.js", ".eslintrc.json" }
  local is_exists = false

  for _, efn in ipairs(eslint_files) do
    local eslint_file = cwd .. "/" .. efn
    is_exists = path_exists(eslint_file)
    if is_exists then
      return is_exists
    end
  end

  return is_exists
end

local common_formatter_config = function()
  --local git_info = vim.b.gitsigns_status_dict

  --if not git_info or not git_info.gitdir then
  if not check_eslint_file_exists() then
    return {
      exe = "prettier",
      args = {
        "--stdin-filepath",
        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
        "--single-quote",
        "--print-width=135",
      },
      stdin = true,
    }
  else
    return {
      exe = "eslint_d",
      args = { "--fix-to-stdout --stdin --stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
      stdin = true,
    }
  end

  --return {
  --  exe = "eslint_d",
  --  args = { " --fix-to-stdout --stdin --debug --stdin-filename", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
  --  stdin = true,
  --}
end

return {
  {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup {
        filetype = {
          yaml = {
            function()
              return {
                exe = "yamlfmt", -- go install github.com/google/yamlfmt/cmd/yamlfmt@latest
                args = {
                  "-",
                },
                stdin = true,
              }
            end,
          },
          lua = {
            function()
              return {
                exe = "stylua",
                args = {
                  "--config-path " --  --.. os.getenv("XDG_CONFIG_HOME")            --  --.. "/stylua/stylua.toml",
                    .. os.getenv "HOME"
                    .. "/.config/nvim/.stylua.toml",
                  "-",
                },
                stdin = true,
              }
            end,
          },
          python = {
            function()
              return {
                exe = "black",
                args = { "-q", "-" },
                stdin = true,
              }
            end,
          },
          nginx = {
            function()
              return {
                --exe = "nginxfmt",
                --exe = "nginxbeautifier", -- npm install -g nginxbeautifier
                exe = "$HOME/usr/local/css-pretty/bin/nginx-pretty",
                args = { "-t", 1, vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
                stdin = true,
              }
            end,
          },

          --vim = {
          --  function()
          --    return {
          --      exe = "vint",
          --      args = { "--color --style --stdin-display-name", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
          --      stdin = true,
          --    }
          --  end,
          --},
          json = {
            function()
              --return {
              --  exe = "prettier",
              --  args = { "--stdin --stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote" },
              --  stdin = true,
              --}
              return {
                exe = "jq",
                args = { ".", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
                stdin = true,
              }
            end,
          },
          markdown = {
            function()
              return {
                exe = "prettier",
                args = {
                  "--stdin --stdin-filepath",
                  vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                  "--double-quote",
                },
                stdin = true,
              }
            end,
          },
          astro = {
            function()
              return common_formatter_config()
            end,
          },
          javascript = {
            function()
              return common_formatter_config()
            end,
          },
          typescript = {
            function()
              return common_formatter_config()
            end,
          },
          javascriptreact = {
            function()
              return common_formatter_config()
            end,
          },
          typescriptreact = {
            function()
              return common_formatter_config()
            end,
          },
          vue = {
            function()
              return common_formatter_config()
            end,
          },
          html = {
            function()
              --return {
              --  exe = "htmlpretty-cli",
              --  args = { "--html", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              --  stdin = true,
              --}
              --return {
              --  exe = "prettier",
              --  args = { "--stdin --single-quote", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
              --  stdin = true,
              --}
              return {
                exe = "$HOME/usr/local/neovim/css-pretty/bin/html-pretty",
                args = {
                  "--stdin --stdin-filepath",
                  vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                },
                stdin = true,
              }

              --return {
              --  exe = "htmlhint",
              --  args = {
              --    " --list ",
              --    vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              --  },
              --  stdin = true,
              --}
            end,
          },
          scss = {
            function()
              return {
                exe = "$HOME/usr/local/neovim/css-pretty/bin/scss-pretty",
                args = { "--stdin ", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },

                stdin = true,
              }
            end,
          },
          less = {
            function()
              return {
                exe = "$HOME/usr/local/neovim/css-pretty/bin/less-pretty",
                args = { "--stdin ", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
                stdin = true,
              }
            end,
          },
          css = {
            function()
              return {
                exe = "$HOME/usr/local/neovim/css-pretty/bin/css-pretty",
                args = { "--stdin ", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
                stdin = true,
              }
            end,
          },
          sh = {
            -- Shell Script Formatter
            function()
              return {
                exe = "shfmt",
                args = { "-i", 2 },
                stdin = true,
              }
            end,
          },
        },
      }

      local map = vim.api.nvim_set_keymap
      local opt = { noremap = true, silent = true }

      map("n", "<leader>f", "<cmd>Format<CR>", opt)
    end,
  },
}
