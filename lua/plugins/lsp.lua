return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "pyright", "volar", "ts_ls", "eslint", "tailwindcss", "clangd" },
			automatic_installation = true
		}
	},
	{
		"neovim/nvim-lspconfig",
		opts = {},
		config = function(_, opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			opts.capabilities = capabilities

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup(opts)
			lspconfig.pyright.setup(opts)
			lspconfig.volar.setup(opts)
			lspconfig.ts_ls.setup(opts)
			lspconfig.tailwindcss.setup(opts)
			lspconfig.eslint.setup(opts)
			lspconfig.clangd.setup(opts)
		end,
		keys = {
			{ "K", function() vim.lsp.buf.hover() end, desc = "Display hover information" },
			{ "gd", function() vim.lsp.buf.definition() end, desc = "Go to definition" },
			{ "gD", function() vim.lsp.buf.declaration() end, desc = "Go to declaration" },
			{ "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code action" }
		}
	},
	{
		"nvimtools/none-ls.nvim", -- this plugin allows you to use tools like linters and formatters as if they were LSPs
		dependencies = {
			"nvimtools/none-ls-extras.nvim"
		},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					require("none-ls.diagnostics.eslint_d"), -- eslint
					null_ls.builtins.formatting.stylua, -- stylua is a formatter for lua files
					null_ls.builtins.formatting.isort, -- formatter for python, sorts imports alphabetically
					null_ls.builtins.formatting.black, -- general python formatter
					null_ls.builtins.diagnostics.pylint, -- python linter
					null_ls.builtins.formatting.prettier,
				},
			})
		end,
		keys = {
			{ "<leader>gf", function() vim.lsp.buf.format() end, desc = "Format code" }
		}
	}
}
