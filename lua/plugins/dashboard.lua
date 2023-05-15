local M = {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local codicons = require("codicons")
    require("dashboard").setup({
      theme = "doom",
      disable_move = false,
      shortcut_type = 'letter',
      change_to_vcs_root = false,
      config = {
        header = {
          [[                                                        ]],
          [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
          [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
          [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
          [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
          [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
          [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
          [[                                                        ]],
        },
        center = {
          {
            icon = codicons.get("project") .. " ",
            icon_hl = "Title",
            desc = " " .. "Projects",
            desc_hl = "String",
            key = "p",
            key_hl = "Number",
            action = ":Telescope projects",
          },
          {
            icon = codicons.get("file") .. " ",
            icon_hl = "Title",
            desc = " " .. "Find File",
            desc_hl = "String",
            key = "f",
            key_hl = "Number",
            action = ":Telescope find_files",
          },
          {
            icon = codicons.get("bookmark") .. " ",
            icon_hl = "Title",
            desc = " " .. "Load Last Session",
            desc_hl = "String",
            key = "s",
            key_hl = "Number",
            action = ":SessionLoadLast",
          },
          {
            icon = codicons.get("settings") .. " ",
            icon_hl = "Title",
            desc = " " .. "Configuration",
            desc_hl = "String",
            key = "c",
            key_hl = "Number",
            action = ":e ~/.config/nvim/",
          },
          {
            icon = codicons.get("settings-gear") .. " ",
            icon_hl = "Title",
            desc = " " .. "Dot Files",
            desc_hl = "String",
            key = "d",
            key_hl = "Number",
            action = ":e ~/.dotfiles/",
          },
          {
            icon = codicons.get("close") .. " ",
            icon_hl = "Title",
            desc = " " .. "Quit",
            desc_hl = "String",
            key = "q",
            key_hl = "Number",
            action = ":q",
          },
        },
        footer = { codicons.get("github") .. "  " .. "jobanmendpara" } --your footer
      },
      hide = {
        statusline,
        tabline,
        winbar,
      },
      preview = {
        command,
        file_path,
        file_height,
        file_width,
      },
    })
  end,
}

return M
