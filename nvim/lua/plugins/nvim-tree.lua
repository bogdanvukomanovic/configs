return {

    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    config = function ()

        require("nvim-tree").setup({

            view = {
                relativenumber = true
            },
            renderer = {
                indent_markers = {
                    enable = true
                }
            }

        })

        vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", {})
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", {})
        vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", {})
        vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", {})

    end

}
