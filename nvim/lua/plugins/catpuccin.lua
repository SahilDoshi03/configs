return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true, -- Enable transparent background
			color_overrides = {
				mocha = {
					base = "#1E1E2E", -- Darker background to contrast with transparency
					mantle = "#181825", -- Slightly lighter than base to make it visible
					crust = "#11111B", -- Dark crust for outer borders

					-- Adjust text colors for better contrast
					text = "#D9E0EE", -- Brighten text color
					subtext1 = "#BAC2DE", -- Subdued but visible
					subtext0 = "#A6ADC8", -- Less prominent than subtext1

					-- Brighter colors for comments, keywords, etc.
					overlay0 = "#6C7086",
					overlay1 = "#7F849C",
					overlay2 = "#9399B2",
					surface0 = "#313244", -- Light surface
					surface1 = "#3A3E58", -- Borders and separators
					surface2 = "#45475A", -- More prominent separators

					-- Brighter keyword colors for visibility in transparent mode
					pink = "#F5C2E7",
					rosewater = "#F2D5CF",
					flamingo = "#F28FAD",
					yellow = "#F9E2AF",
					green = "#A6E3A1",
					blue = "#89B4FA",
					red = "#F38BA8",
				},
			},
			integrations = {
				treesitter = true,
				-- Add other plugin integrations here
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha") -- Set the theme to mocha (or any other flavor)
	end,
}
