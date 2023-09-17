local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    local lualine_selectioncount = require("lualine.components.selectioncount")
    local codicons = require("codicons")

    local branch = {
      "branch",
      icons_enabled = true,
      icon = codicons.get("git-branch"),
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      colored = true,
      update_in_insert = false,
      always_visible = true,
    }

    local function diff_source()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    local diff = {
      "diff",
      colored = true,
      separator = "%#SLSeparator#" .. "│ " .. "%* ",
      symbols = {
        added = codicons.get("diff-added") .. " ",
        modified = codicons.get("diff-modified") .. " ",
        removed = codicons.get("diff-removed") .. " ",
      },
      source = diff_source,
    }

    local function selectionCount()
      if lualine_selectioncount() == "" then
        return 0
      else
        return lualine_selectioncount()
      end
    end

    return {
      options = {
        always_divide_middle = true,
        component_separators = "",
        disabled_filetypes = {},
        globalstatus = true,
        icons_enabled = true,
        section_separators = "",
        theme = "auto",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = false,
            fmt = function()
              return "ﮧ "
            end,
          },
        },
        lualine_b = { branch },
        lualine_c = { diagnostics },
        lualine_x = { "tabs", "filetype" },
        lualine_y = { diff },
        lualine_z = {
          selectionCount,
          {
            "location",
            padding = 0,
          },
        },
      },
      extensions = { "lazy" },
    }
  end,
}

return M
