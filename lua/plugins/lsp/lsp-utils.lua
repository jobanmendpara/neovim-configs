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

	vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts("View Declaration"))
	vim.keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", opts("Telescope Definitions"))
	vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", opts("Telescope References"))
	vim.keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", opts("Telescope Implementations"))
	vim.keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", opts("Telescope Type Definitions"))
  vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts("Diagnostics"))
	vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts("Hover"))
	vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts("Signature Help"))
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
  vim.keymap.set("n", "<leader>d;", "<cmd>lua vim.diagnostic.goto_next({ border = 'rounded'})<cr>", opts("Diagnostics - Next"))
  vim.keymap.set("n", "<leader>d,", "<cmd>lua vim.diagnostic.goto_prev({ border = 'rounded'})<cr>", opts("Diagnostics - Prev"))
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
	-- show diagnostics in hover window
	vim.api.nvim_create_autocmd("CursorHold", {
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
	})
end

M.on_attach = function(client, bufnr)
end

return M
