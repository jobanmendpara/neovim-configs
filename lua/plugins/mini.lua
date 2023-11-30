local M = {
  "echasnovski/mini.nvim",
  branch = "main",
  event = "BufEnter",
  config = function()
    local mini_ai = require("mini.ai").setup()
    local mini_bracketed = require("mini.bracketed").setup()
    local mini_comment = require("mini.comment").setup({
      mappings = {
        comment = 'gc',
        comment_line = 'gc',
      },
    })
    local mini_cursorword = require("mini.cursorword").setup()
    local mini_clue = require("mini.clue")
    mini_clue.setup({
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = '<C-l>' },
        { mode = 'n', keys = '"' },
        { mode = 'i', keys = '<C-x>' }
      },
      clues = {
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.windows({
          submode_move = true,
          submode_navigate = true,
          submode_resize = true,
        }),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.z(),
        mini_clue.gen_clues.registers({
          show_contents = true,
        }),
        { mode = 'n', keys = '<leader>,',  desc = 'Preferences' },
        { mode = 'n', keys = '<leader>f',  desc = 'Find' },
        { mode = 'n', keys = '<leader>j',  desc = 'Jump' },
        { mode = 'n', keys = '<leader>l',  desc = 'LSP' },
        { mode = 'n', keys = '<leader>m',  desc = 'Move' },
        { mode = 'n', keys = '<leader>w',  desc = 'Window' },
        { mode = 'n', keys = '<leader>t',  desc = 'Telescope' },
        { mode = 'n', keys = '[p',         postkeys = '[' },
        { mode = 'n', keys = ']p',         postkeys = ']' },
        { mode = 'n', keys = '[d',         postkeys = '[' },
        { mode = 'n', keys = ']d',         postkeys = ']' },
        { mode = 'n', keys = '[m',         postkeys = '[' },
        { mode = 'n', keys = ']m',         postkeys = ']' },
        { mode = 'n', keys = '[<TAB>',     postkeys = '[' },
        { mode = 'n', keys = ']<TAB>',     postkeys = ']' },
        { mode = 'n', keys = '<C-w><C-h>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<C-w><C-l>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<C-w><C-j>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<C-w><C-k>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<Leader>mh', postkeys = '<Leader>m' },
        { mode = 'n', keys = '<Leader>mj', postkeys = '<Leader>m' },
        { mode = 'n', keys = '<Leader>mk', postkeys = '<Leader>m' },
        { mode = 'n', keys = '<Leader>ml', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>mh', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>mj', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>mk', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>ml', postkeys = '<Leader>m' },
      },
      window = {
        config = {
          width = 'auto',
          border = 'single',
        },
        delay = 100,
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
      },
    })
    local mini_files = require("mini.files").setup({
      mappings = {
        close = "<ESC>"
      },
      window = {
        preview = true,
      },
    })
    local mini_indentscope = require("mini.indentscope").setup({
      draw = {
        delay = 100,
        priority = 2,
      },
      mappings = {
        object_scope = 'ii',
        object_scope_with_border = 'ai',
        goto_top = '[i',
        goto_bottom = ']i',
      },
      options = {
        border = 'both',
        indent_at_cursor = true,
        try_as_border = false,
      },
      symbol = '╎',
    })
    local mini_move = require("mini.move").setup({
      mappings = {
        left       = '<Leader>mh',
        right      = '<Leader>ml',
        down       = '<Leader>mj',
        up         = '<Leader>mk',
        line_left  = '<Leader>mh',
        line_right = '<Leader>ml',
        line_down  = '<Leader>mj',
        line_up    = '<Leader>mk',
      },
    })
    local mini_pairs = require("mini.pairs").setup()
    -- local mini_pick = require("mini.pick").setup()
    local mini_operators = require("mini.operators").setup()
    local mini_sessions = require("mini.sessions").setup({
      autoread = false,
      autowrite = true,
    })
    local mini_splitjoin = require("mini.splitjoin").setup()
    local mini_starter = require("mini.starter")
    mini_starter.setup({
      content_hooks = {
        mini_starter.gen_hook.adding_bullet(""),
        mini_starter.gen_hook.aligning("center", "center"),
      },
      evaluate_single = true,
      header = os.date(),
      query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
      items = {
        mini_starter.sections.sessions(5, true),
        { action = "Lazy sync", name = "u: Update Plugins", section = "Plugins" },
        { action = "enew", name = "e: New Buffer", section = "Builtin actions" },
        { action = "qa!", name = "q: Quit Neovim", section = "Builtin actions" },
        { action = "e ~/.dotfiles/nvim/.config/nvim/init.lua", name = "c: Configure Neovim", section = "Builtin actions" },
        { action = "e ~/.dotfiles/wezterm/.wezterm.lua", name = "w: Configure Wezterm", section = "Builtin actions" },
        { action = "e ~/.dotfiles/", name = ".: Dotfiles", section = "Builtin actions" },
      }
    })
    local mini_surround = require("mini.surround").setup()
    local mini_trailspace = require("mini.trailspace").setup()
    local mini_visits = require("mini.visits").setup()
  end,
  keys = {
    { "mf", "<CMD>lua MiniVisits.add_label()<CR>", desc = "Add Label" },
    { "mF", "<CMD>lua MiniVisits.remove_label()<CR>", desc = "Remove Label" },
    { "[p", "<CMD>lua MiniVisits.iterate_paths('forward')<CR>", desc = "Cycle Paths Backward"},
    { "]p", "<CMD>lua MiniVisits.iterate_paths('backward')<CR>", desc = "Cycle Paths Forward"},
  },
}

return M
