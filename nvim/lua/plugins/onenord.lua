return {

    "rmehri01/onenord.nvim",
    name = "onenord",
    priority = 1000,

    config = function()

        require("onenord").setup({

            disable = {
                background = true,
                float_background = true,
                cursorline = true,
                eob_lines = true
            },

        })

        vim.cmd.colorscheme = "onenord"

    end

}
