return {

    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Completions
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                -- "pyright",
                "pylsp",
                -- "rust_analyzer"
            },
            handlers = {

                -- Default handler
                -- function(server_name)
                --     require("lspconfig")[server_name].setup({
                --         capabilities = capabilities
                --     })
                -- end,

                ["lua_ls"] = function()
                    require("lspconfig")["lua_ls"].setup {
                        settings = {
                            Lua = {
                                capabilities = capabilities,
				                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim" },
                                }
                            }
                        }
                    }
                end,

                ["pylsp"] = function ()
                    require("lspconfig")["pylsp"].setup {
                        -- capabilities = capabilities,
                        settings = {
                            pylsp = {
                                plugins = {
                                    pycodestyle = {
                                        ignore = {"E501", "W391"},
                                        maxLineLength = 80
                                    }
                                }
                            }
                        }
                    }
                end,

                -- ["rust_analyzer"] = function ()
                --     require("lspconfig")["rust_analyzer"].setup {
                --         settings = {
                --             ['rust-analyzer'] = {
                --                 assist = {
                --                     importEnforceGranularity = true,
                --                     importPrefix = "create"
                --                 },
                --                 cargo = {allFeatures = true},
                --                 checkOnSave = {
                --                     -- default: `cargo check`
                --                     command = "clippy",
                --                     allFeatures = true
                --                 },
                --                 inlayHints = {
                --                     lifetimeElisionHints = {
                --                         enable = true,
                --                         useParameterNames = true
                --                     }
                --                 }
                --             }
                --         }
                --     }
                -- end

            }

        })

        -- Global mappings.
        vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

        -- Following key mappings are available only after the LS attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set("n", "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", '<space>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })

        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                    { name = "buffer" },
                }),

            require("luasnip.loaders.from_vscode").lazy_load(),
        })


    end

}
