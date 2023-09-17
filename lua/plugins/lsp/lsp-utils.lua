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
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Doc" })
  vim.keymap.set("n", "gd", "<CMD>Telescope lsp_definitions<CR>", { desc = "Definition"})
  vim.keymap.set("n", "gD", "<CMD>Telescope lsp_declarations<CR>", { desc = "Declaration"})
  vim.keymap.set("n", "gI", "<CMD>Telescope lsp_implementations<CR>", { desc = "Declaration"})
  vim.keymap.set("n", "gl", "<CMD>lua vim.diagnostic.open_float()<CR>", { desc = "Diagnostic"})
  vim.keymap.set("n", "gR", "<CMD>Telescope lsp_references<CR>", { desc = "References"})
  vim.keymap.set("n", "gT", "<CMD>Telescope lsp_type_definition<CR>", { desc = "Type Definition"})
  vim.keymap.set("n", "<leader>.", "<CMD>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action"})
  -- vim.keymap.set("n", "<C-R>", "<CMD>lua vim.lsp.buf.rename()<CR>", { desc = "Rename in Buffer"})

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local function opts(desc)
    return {
      desc = desc,
      noremap = true,
      silent = true,
    }
  end

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
