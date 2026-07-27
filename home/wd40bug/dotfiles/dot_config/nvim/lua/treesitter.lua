local tln = ']' -- Tree Leader Next
local tlp = '[' -- Tree Leader Previous

if System == "fedora-work" then
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true, -- Better syntax highlighting
      },
      indent = {
        enable = true
      },
      textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
          ['i;'] = 'textsubjects-container-inner',
        },
      },
      textobjects = {
        select = { -- Selections of text objects
          enable = true,
          lookahead = true,
          keymaps = {
            ['ap'] = '@parameter.outer',
            ['ip'] = '@parameter.inner',
            ['l'] = '@assignment.lhs',
            ['r'] = '@assignment.rhs',

          }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [tln .. 'f'] = '@function.outer',
            [tln .. 't'] = '@class.outer',
            [tln .. 'p'] = '@parameter.outer',
            [tln .. 'r'] = '@return.outer',


          },
          goto_next_end = {
            [tln .. 'F'] = '@function.outer',
            [tln .. 'T'] = '@class.outer',
            [tln .. 'P'] = '@parameter.outer',
            [tln .. 'R'] = '@return.outer',


          },
          goto_previous_start = {
            [tlp .. 'f'] = '@function.outer',
            [tlp .. 't'] = '@class.outer',
            [tlp .. 'p'] = '@parameter.outer',
            [tlp .. 'r'] = '@return.outer',


          },
          goto_previous_end = {
            [tlp .. 'F'] = '@function.outer',
            [tlp .. 'T'] = '@class.outer',
            [tlp .. 'P'] = '@parameter.outer',
            [tlp .. 'R'] = '@return.outer',


          },
        }
      },
      ensure_installed = {
        'rust',
        'c',
        'json',
        'toml',
        'verilog',
        'lua',
        'markdown',
        'vimdoc',
        'java',
        'svelte',
      },
    })
else
    local languages = { "python", "rust", "lua", "markdown", "markdown_inline", "c", "json" }

    -- This replaces the old ensure_installed table
    vim.api.nvim_create_autocmd("User", {
        pattern = "LazyDone",
        callback = function()
            for _, lang in ipairs(languages) do
                local stats = vim.uv.fs_stat(vim.api.nvim_get_runtime_file("parser/" .. lang .. ".so", false)[1] or "")
                if not stats then
                    vim.cmd("TSInstall " .. lang)
                end
            end
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "python", "rust", "lua", "c", "json", "cpp" }, -- Add your languages here
      callback = function(args)
        -- This is the NEW way to "enable" highlighting
        vim.treesitter.start(args.buf)
        
        -- This replaces indent = { enable = true }
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

end


