return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("arrow").setup({
			show_icons = true,
			separate_save_and_remove = true,
			leader_key = ";", -- Recommended to be a single key
			buffer_leader_key = "m", -- Per Buffer Mappings
			mappings = {
				remove = "x",
			},
		})
		vim.keymap.set("n", "H", require("arrow.persist").previous)
		vim.keymap.set("n", "L", require("arrow.persist").next)
		vim.keymap.set("n", "<C-s>", require("arrow.persist").toggle)
	end,
}
