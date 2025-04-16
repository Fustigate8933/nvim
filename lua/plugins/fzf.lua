return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	lazy = false, -- want to use the ui select so if true ui select will only work when fzf is lazy loaded after calling it
	config = function(_, opts)
		local fzf = require("fzf-lua")
		fzf.setup(opts)
		fzf.register_ui_select({
			winopts = {
				title = "Select Option",
				border = "rounded",
			}
		})
	end,
	keys = {
		{ "<leader>lg", "<cmd>FzfLua live_grep<CR>", desc = "Fzf live grep" }
	}
}
