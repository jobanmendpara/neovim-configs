local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl_shortcut = "Macro"
      return b
    end

    local icons = require("codicons")

    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      button("f", icons.get("files") .. " Find file", "<CMD>Telescope find_files<CR>"),
      button("n", icons.get("file") .. " New file", "<CMD>ene <BAR> startinsert<CR>"),
      button(
        "p",
        icons.get("project") .. " Find project",
        " <CMD>Telescope project<CR>"
      ),
      button("r", icons.get("go-to-file") .. " Recent files", "<CMD>Telescope oldfiles<CR>"),
      button("t", icons.get("regex") .. " Find text", "<CMD>Telescope live_grep<CR>"),
      button("s", icons.get("reply") .. " Load Last Session", "<CMD>SessionLoadLast<CR>"),
      button("c", icons.get("settings-gear") .. " Config", "<CMD>e ~/.config/nvim/lua/<CR>"),
      button("u", icons.get("sync") .. " Sync", "<CMD>Lazy sync<CR>"),
      button("q", icons.get("close-all") .. " Quit", "<CMD>qa<CR>"),
    }

    dashboard.section.footer.val = "@NullMello"

    dashboard.section.header.opts.hl = "Include"
    dashboard.section.buttons.opts.hl = "Macro"
    dashboard.section.footer.opts.hl = "Type"

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}

return M
