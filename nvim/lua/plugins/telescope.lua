return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules" }, -- ignores node_modules
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<C-p>", builtin.git_files, {})
			vim.keymap.set("n", "<leader>fd", function()
				require("telescope.builtin").find_files({
					prompt_title = "Find Folders",
					-- Replace 'fd' with 'find' if fd is not installed or 'fd' command isn't working
					find_command = {
						"find",
						".",
						"-type",
						"d",
						"-not",
						"-path",
						"./.git*",
						"-not",
						"-path",
						"./node_modules*",
					},
				})
			end, {})
		end,
	},
}
