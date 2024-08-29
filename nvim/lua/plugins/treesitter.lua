return {

    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function ()

        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "python", "java", "rust", "c", "cpp", "lua", "vim", "vimdoc" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
          })

    end

}
