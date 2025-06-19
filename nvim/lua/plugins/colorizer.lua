return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre",
	config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			user_default_options = {
				names = true,
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				css = true,
				css_fn = true,
				mode = "background",
				tailwind = true,
				sass = { enable = true, parsers = { "css" } },
				virtualtext = "■",
				virtualtext_inline = true,
				virtualtext_mode = "foreground",
				always_update = true,
			},
			buftypes = {},
			user_commands = true,
		})
	end,
}
