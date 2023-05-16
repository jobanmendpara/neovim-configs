return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-project.nvim" },
  },
  keys = {},
  opts = function()
    local icons = require("codicons")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")

    return {
      pickers = {
        fd = {
          theme = "ivy",
        },
        find_files = {
          hidden = true,
          theme = "ivy",
          no_ignore = true,
          fuzzy = true,
          -- find_command = { "fd", "--hidden", "--exclude", ".git"},
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
          theme = "ivy",
        },
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--hidden",
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
            preview_width = 0.55,
            results_width = 0.55,
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
        file_ignore_patterns = { "node_modules", ".git" },
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
          hidden = {
            file_browser = true,
            folder_broswer = true,
          },
          respect_gitignore = false,
          theme = "ivy",
          hijack_netrw = true,
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          theme = "ivy",
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension("project")
    telescope.load_extension("persisted")
  end,
}
