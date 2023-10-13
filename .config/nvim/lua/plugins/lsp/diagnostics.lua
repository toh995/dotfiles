-- @module plugins.lsp.diagnostics
local M = {}

M.Icons = {
	ERROR = "󰅚 ",
	WARN = "󰀪 ",
	HINT = "󰌶 ",
	INFO = "󰋽 ",
}

function M.configure()
	local util = require("../../util")

	-- set up some diagnostic behavior
	vim.diagnostic.config({
		update_in_insert = true,
		severity_sort = true,
		virtual_text = { prefix = "●" },
	})

	-- set the icons for the signs column
	-- i.e. the column left of the line numbers
	for name, icon in pairs(M.Icons) do
		local normalized = string.lower(name)
		normalized = util.capitalize_first_letter(normalized)

		local hl = "DiagnosticSign" .. normalized
		vim.fn.sign_define(hl, {
			text = icon,
			texthl = hl,
			numhl = hl,
		})
	end
end

return M