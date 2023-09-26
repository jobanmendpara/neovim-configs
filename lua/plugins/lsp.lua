local M = {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({buffer = bufnr})
        vim.keymap.set("n", "<A-.>", vim.lsp.buf.code_action, { desc = "Code Action" })
        vim.keymap.set("n", "<A-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
      end)

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          lsp_zero.default_setup,

          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })

      local signs = require("utils").lsp_signs

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      local function enhanced_float_handler(handler)
        return function(err, result, ctx, config)
          local buf, win = handler(
            err,
            result,
            ctx,
            vim.tbl_deep_extend('force', config or {}, {
              border = 'rounded',
              max_height = math.floor(vim.o.lines * 0.5),
              max_width = math.floor(vim.o.columns * 0.4),
            })
          )

          if not buf or not win then
            return
          end

          -- Conceal everything.
          vim.wo[win].concealcursor = 'n'

          -- Extra highlights.
          for l, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
            for pattern, hl_group in pairs {
              ['|%S-|'] = '@text.reference',
              ['@%S+'] = '@parameter',
              ['^%s*(Parameters:)'] = '@text.title',
              ['^%s*(Return:)'] = '@text.title',
              ['^%s*(See also:)'] = '@text.title',
              ['{%S-}'] = '@parameter',
            } do
              local from = 1 ---@type integer?
              while from do
                local to
                from, to = line:find(pattern, from)
                if from then
                  vim.api.nvim_buf_set_extmark(buf, md_namespace, l - 1, from - 1, {
                    end_col = to,
                    hl_group = hl_group,
                  })
                end
                from = to and to + 1 or nil
              end
            end
          end

          -- Add keymaps for opening links.
          if not vim.b[buf].markdown_keys then
            vim.keymap.set('n', 'K', function()
              -- Vim help links.
              local url = (vim.fn.expand '<cWORD>' --[[@as string]]):match '|(%S-)|'
              if url then
                return vim.cmd.help(url)
              end

              -- Markdown links.
              local col = vim.api.nvim_win_get_cursor(0)[2] + 1
              local from, to
              from, to, url = vim.api.nvim_get_current_line():find '%[.-%]%((%S-)%)'
              if from and col >= from and col <= to then
                vim.system({ 'open', url }, nil, function(res)
                  if res.code ~= 0 then
                    vim.notify('Failed to open URL' .. url, vim.log.levels.ERROR)
                  end
                end)
              end
            end, { buffer = buf, silent = true })
            vim.b[buf].markdown_keys = true
          end
        end
      end

      local methods = vim.lsp.protocol.Methods
      vim.lsp.handlers[methods.textDocument_hover] = enhanced_float_handler(vim.lsp.handlers.hover)
      vim.lsp.handlers[methods.textDocument_signatureHelp] = enhanced_float_handler(vim.lsp.handlers.signature_help)
    end
  }
}

return M
