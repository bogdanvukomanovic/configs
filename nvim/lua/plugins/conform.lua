return {

    "stevearc/conform.nvim",

    config = function ()

        local conform = require("conform")

        conform.setup({

            formatters_by_ft = {

                lua = { "stylua" },
                python = { "isort", "black" }

            },
            -- format_on_save = {
            --     lsp_fallback = true,
            --     async = false,
            --     timeout_ms = 1000
            -- }

        })

        vim.keymap.set({ "n", "v" }, "<leader>gf", function ()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, {})

    end

}
