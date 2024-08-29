return {

    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function ()

        local actions = require("telescope.actions")

        require("telescope").setup({

            defaults = {

                -- path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-q>"] = actions.send_selected_to_qflist
                    },
                    n = {
                        ["<C-q>"] = actions.send_selected_to_qflist
                    }
                }

            },
            -- pickers = {
            --
            --     oldfiles = {
            --         theme = "ivy"
            --     }
            --
            -- }


        })

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
        vim.keymap.set("n", "<leader>fc", builtin.commands, {})

        vim.keymap.set("n", "<leader>fq", builtin.quickfix, {})

        vim.keymap.set("n", "<leader>fws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>fWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set("n", "<leader>fgr", function()
            builtin.grep_string({ search = vim.fn.input("GREP > ") })
        end)

    end

}
