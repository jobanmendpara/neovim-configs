local M = {
  "echasnovski/mini.statusline",
  event = "VeryLazy",
  config = function()
    local icons = require('codicons')
    local mini_statusline = require("mini.statusline")
    mini_statusline.setup({
      use_icons = true,
      content = {
        active = function()
          local mode, mode_hl = mini_statusline.section_mode({ trunc_width = 999 })
          local git           = mini_statusline.section_git({ trunc_width = nil })
          local diagnostics   = mini_statusline.section_diagnostics({ trunc_width = 120, })
          local filename      = mini_statusline.section_filename({ trunc_width = 120 })
          local fileinfo      = mini_statusline.section_fileinfo({ trunc_width = 120 })
          local location      = mini_statusline.section_location({ trunc_width = 75 })
          local search        = mini_statusline.section_searchcount({ trunc_width = 75 })
          local tabs          = function()
            local current_tab = vim.fn.tabpagenr()
            local total_tabs = vim.fn.tabpagenr('$')
            return current_tab .. '/' .. total_tabs
          end

          return mini_statusline.combine_groups({
            { hl = mode_hl,                 strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
            '%<', -- Mark general truncate point
            {
              hl = 'MiniStatuslineFilename',
              strings = { tabs() },
            },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%<',
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl,                  strings = { search, location } },
          })
        end
      },
      set_vim_settings = false,
    })
  end,
}

return M
