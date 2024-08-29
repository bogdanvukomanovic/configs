return {

    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

    config = function ()

        local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[⠀⠀⠀⠀⠀⠀⢀⠌⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡤⠴⠒⠈]],
            [[⠀⠀⠀⠀⠀⣰⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣶⠾⠟⠋⠁⠀⠀⠀⠀]],
            [[⠀⠀⠀⢀⣾⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣶⣾⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⢠⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣶⣿⣿⣿⣿⣿⡿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⢠⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⢀⣿⣿⣿⣿⣿⣿⣷⣤⣀⣀⣀⣀⣀⣠⣤⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
            [[⠀⠀⠙⠻⢿⣿⣿⣿⣿⡿⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
        }

		_Gopts = {
			position = "center",
			hl = "Type",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "󰈚   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
			dashboard.button("g", "󰱼   Find word", ":Telescope live_grep<CR>"),
			dashboard.button("r", "󱌣   Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "   Config", ":e $MYVIMRC <CR>"),
			dashboard.button("q", "󰒲   Quit NVIM", ":qa<CR>"),
		}

		local function footer()
			return "Quo vadis, Domine?"
		end
		dashboard.section.footer.val = footer()

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)

        -- Cursor
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            desc = "Hide cursor for alpha-nvim",
            callback = function()
                local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
                hl.blend = 100
                vim.api.nvim_set_hl(0, "Cursor", hl)
                vim.opt.guicursor:append("a:Cursor/lCursor")
            end,
        })
        vim.api.nvim_create_autocmd("BufUnload", {
            buffer = 0,
            desc = "Show cursor after alpha-nvim",
            callback = function()
                local hl = vim.api.nvim_get_hl_by_name("Cursor", true)
                hl.blend = 0
                vim.api.nvim_set_hl(0, "Cursor", hl)
                vim.opt.guicursor:remove("a:Cursor/lCursor")
            end,
        })

		require("alpha").setup(dashboard.opts)

    end

}
