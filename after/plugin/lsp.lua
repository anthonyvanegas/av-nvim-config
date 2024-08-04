require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = {
		-- Markup
		'marksman',
		-- Python
		'pylsp',
		'ruff',
		'ruff_lsp',
	}
}
