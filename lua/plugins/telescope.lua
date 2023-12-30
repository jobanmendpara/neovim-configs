local cmd = require("utils").cmd

local M = {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
    { "LukasPietzschmann/telescope-tabs" },
    { "DanielVolchek/tailiscope.nvim" },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local finders = require("telescope.finders")
    local icons = require("codicons")
    local pickers = require("telescope.pickers")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")
    local config = require("telescope.config").values
    local telescope = require("telescope")
    local telescope_tabs = require("telescope-tabs")

    telescope_tabs.setup()
    telescope.setup({
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
          fuzzy = true,
          find_command = { "fd", "-t", "f" },
        },
        live_grep = {},
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
        file_ignore_patterns = { "node_modules", ".git", "dist", "presets" },
        hidden = true,
        generic_sorter = sorters.get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
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
        ["ui-select"] = {
          layout_config = {
            width = 0.3,
            height = 0.5,
          },
        }
      }
    })
    telescope.load_extension("ui-select")
    telescope.load_extension("fzf")
    telescope.load_extension("telescope-tabs")
    telescope.load_extension("tailiscope")

    local visits_picker = function()
      local project_root = require("utils").find_git_root()
      if not project_root then
        print("Project root not found.")
        return
      end

      local visits_finder = function()
        return finders.new_table({
          results = require("mini.visits").list_paths(),
          entry_maker = function(entry)
            local relative_path = vim.fn.fnamemodify(entry, ':.'):gsub(vim.pesc(project_root) .. '/', '')
            return {
              value = entry,
              display = relative_path,
              ordinal = relative_path,
            }
          end,
        })
      end

      -- My Pickers
      pickers.new({}, {
        prompt_title = "Visits",
        finder = visits_finder(),
        previewer = previewers.vim_buffer_cat.new({}),
        sorter = config.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
          map('i', '<M-d>', function()
            local selection = action_state.get_selected_entry()
            local current_picker = action_state.get_current_picker(prompt_bufnr)
            require("mini.visits").remove_path(selection.value)

            current_picker:refresh(visits_finder(), { reset_prompt = true })
          end)
          map('i', '<M-v>', function()
            actions.close(prompt_bufnr)
          end)
          return true
        end,
      }):find()
    end
    vim.api.nvim_create_user_command('Visits', visits_picker, {})
  end,
  keys = {
    {
      "<leader>t",
      ":Telescope ",
      desc = "Telescope - Menu"
    },
    {
      "<leader>,o",
      cmd("Telescope vim_options"),
      desc = "Telescope - Options"
    },
    {
      "<leader>ff",
      cmd("Telescope find_files"),
      desc = "Telescope - Find Files"
    },
    {
      "<M-/>",
      cmd("Telescope live_grep"),
      desc = "Telescope - Live Grep"
    },
    {
      "<M-f>",
      cmd("Telescope current_buffer_fuzzy_find"),
      desc = "Telescope - Find in Buffer"
    },
    {
      "<leader>fv",
      cmd("Visits"),
      desc = "View Marked Files"
    },
  }
}

return M
