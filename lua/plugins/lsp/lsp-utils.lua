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
	vim.keymap.set("n", "<leader>gf", "<CMD>Lspsaga lsp_finder<CR>", opts("Find in LSP"))
  vim.keymap.set("n", "<leader>ca", "<CMD>Lspsaga code_action<CR>", opts("Code Action"))
	vim.keymap.set("n", "<leader>rn", "<CMD>Lspsaga rename<CR>", opts("Rename"))
	vim.keymap.set("n", "<leader>gp", "<CMD>Lspsaga peek_definition<CR>", opts("Peek Definition"))
	vim.keymap.set("n", "<leader>gd", "<CMD>Lspsaga goto_definition<CR>", opts("Go to Definition"))
	vim.keymap.set("n", "<leader>gt", "<CMD>Lspsaga goto_type_definition<CR>", opts("Go to Type Definition"))
	vim.keymap.set("n", "<leader>gT", "<CMD>Lspsaga peek_type_definition<CR>", opts("Peek Type Definition"))
  vim.keymap.set("n", "<leader>sl", "<CMD>Lspsaga show_line_diagnostics<CR>", opts("Show Line Diagnostics"))
  vim.keymap.set("n", "<leader>sc", "<CMD>Lspsaga show_cursor_diagnostics<CR>", opts("Show Cursor Diagnostics"))
  vim.keymap.set("n", "<leader>go", "<CMD>Lspsaga outline<CR>", opts("Outline"))
	vim.keymap.set("n", "<S-k>", "<CMD>Lspsaga hover_doc<CR>", opts("Hover Doc"))
	vim.keymap.set("n", "<leader><S-K>", vim.lsp.buf.signature_help, opts("Signature Help"))
	vim.keymap.set("n", "<C-t>", "<CMD>Lspsaga term_toggle<CR>", opts("Terminal"))
	vim.keymap.set("n", "<leader>gr", "<CMD>Telescope lsp_references<CR>", opts("View References"))
	vim.keymap.set("n", "<leader>gi", "<CMD>Telescope lsp_implementations<cr>", opts("Telescope Implementations"))


  vim.keymap.set("n", "<leader>d;", "<CMD>Lspsaga diagnostic_jump_next<CR>", opts("Diagnostics - Next"))
  vim.keymap.set("n", "<leader>d,", "<CMD>Lspsaga diagnostic_jump_prev<CR>", opts("Diagnostics - Prev"))

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
