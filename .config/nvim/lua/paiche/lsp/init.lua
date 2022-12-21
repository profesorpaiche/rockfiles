local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("paiche.lsp.lsp-installer")
require("paiche.lsp.handlers").setup()
