local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
  enabled = true,
	opts = {
		lsp = {
      hover = {
        enabled = false,
      },
			override = {
				-- override the default lsp markdown formatter with Noice
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				-- override the lsp markdown formatter with Noice
				["vim.lsp.util.stylize_markdown"] = true,
				-- override cmp documentation with Noice (needs the other options to work)
				["cmp.entry.get_documentation"] = true,
			},
      signature = {
        enabled = false,
      },
		},
		presets = {
			command_palette = true,
		},
	},
}

return M
