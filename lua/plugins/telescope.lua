local  M = {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  tag = "0.1.2",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
  },
  config = function()
    local icons = require("codicons")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")
    local telescope = require("telescope")

    telescope.setup({
      pickers = {
        fd = {
          layout_strategy = "horizontal",
        },
        find_files = {
          hidden = false,
          no_ignore = false,
          fuzzy = true,
          -- layout_strategy = "horizontal",
          find_command = { "fd", "-t","f"},
          -- find_command = { "rg", "--files"}
        },
        live_grep = {
        },
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = icons.get("search") .. "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.50,
            results_width = 0.50,
          },
          vertical = {
            mirror = false,
            prompt_position = "bottom",
          },
          width = 0.97,
          height = 0.90,
          preview_cutoff = 0,
        },
        file_sorter = sorters.get_fuzzy_file,
        file_ignore_patterns = { "node_modules", ".git", "dist" },
        hidden = true,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = previewers.buffer_previewer_maker,
        mappings = {
          n = { ["q"] = actions.close },
        },
      },
      extensions = {
        file_browser = {
          mappings = {},
          hidden = {
            file_browser = true,
            folder_broswer = true,
          },
          respect_gitignore = false,
          hijack_netrw = true,
          use_fd = true,
          auto_depth = false,
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        project = {
          base_dirs = {
            '~/Developer/uTyme/web',
            '~/Developer/uTyme/service',
            '~/Developer/uTyme/types',
            '~/.dotfiles/nvim/.config/nvim',
          },
        },
        ["ui-select"] = {
        },
      },
    })
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
    telescope.load_extension("fzf")
  end,
}

return M
