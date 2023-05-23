local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
  vim.diagnostic.config({
    virtual_text = false,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
  })

  ---- sign column
  local signs = require("utils").lsp_signs

  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local function opts(desc)
    return {
      desc = desc,
      noremap = true,
      silent = true,
    }
  end

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
  vim.keymap.set("n", "<leader>gd", "<CMD>Telescope lsp_definitions<CR>", opts("Go to Definition"))
  vim.keymap.set("n", "<leader>go", "<CMD>SymbolsOutline<CR>", opts("Outline"))
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts("Hover Doc"))
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, opts("Signature Help"))
  vim.keymap.set("n", "<leader>gr", "<CMD>Telescope lsp_references<CR>", opts("View References"))
  vim.keymap.set("n", "<leader>gi", "<CMD>Telescope lsp_implementations<cr>", opts("Telescope Implementations"))
  vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts("Rename"))

  vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts("Show Line Diagnostics"))

  vim.keymap.set("n", "<leader>fF", function()
    vim.lsp.buf.format({ async = true })
    vim.api.nvim_command("update")
  end, { desc = "LSP - Format Buffer" })

  -- Automatically show diagnostics at cursor position
  --[[ vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  }) ]]
end

M.on_attach = function(client, bufnr) end
return M
