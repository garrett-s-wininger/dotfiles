return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim", opts = {} },
        {
            "folke/neodev.nvim",
            opts = {},
            enabled = (vim.fn.has("nvim-0.10") == 0)
        },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                }
            },
            enabled = (vim.fn.has("nvim-0.10") == 1)
        },
        { "Bilal2453/luvit-meta", lazy = true },
        {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            dependencies = {
                {
                    "L3MON4D3/LuaSnip",
                    build = function(_)
                        if (vim.fn.executable("make") == 1) then
                            os.execute("make install_jsregexp")
                        end
                    end
                },
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path"
            },
            opts = function(_, opts)
                if (vim.fn.has("nvim-0.10") == 1) then
                    opts.sources = opts.sources or {}
                    table.insert(opts.sources, {
                        name = "lazydev",
                        group_index = 0
                    })
                end
            end,
            config = function()
                local cmp = require "cmp"
                local luasnip = require "luasnip"
                luasnip.config.setup {}

                cmp.setup {
                    snippet = {
                        expand = function(args)
                            luasnip.lsp_expand(args.body)
                        end
                    },
                    completion = { completeopt = "menu,menuone,noinsert" },
                    mapping = cmp.mapping.preset.insert {
                        ["<C-n>"] = cmp.mapping.select_next_item(),
                        ["<C-p>"] = cmp.mapping.select_prev_item(),
                        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                        ["<C-f>"] = cmp.mapping.scroll_docs(4),
                        ["<C-y>"] = cmp.mapping.confirm { select = true },
                        ["<C-Space>"] = cmp.mapping.complete {}
                    },
                    sources = {
                        { name = "nvim_lsp" },
                        { name = "luasnip" },
                        { name = "path" }
                    }
                }
            end
        }
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup(
                "lsp-attach",
                { clear = true }
            ),
            callback = function(_)
                vim.keymap.set(
                    "n",
                    "gd",
                    require("telescope.builtin").lsp_definitions
                )
                vim.keymap.set(
                    "n",
                    "gr",
                    require("telescope.builtin").lsp_references
                )
                vim.keymap.set(
                    "n",
                    "gI",
                    require("telescope.builtin").lsp_implementations
                )
                vim.keymap.set(
                    "n",
                    "<leader>D",
                    require("telescope.builtin").lsp_type_definitions
                )
                vim.keymap.set(
                    "n",
                    "<leader>ds",
                    require("telescope.builtin").lsp_document_symbols
                )
                vim.keymap.set(
                    "n",
                    "<leader>ca",
                    vim.lsp.buf.code_action
                )
                vim.keymap.set(
                    "n",
                    "<leader>rn",
                    vim.lsp.buf.rename
                )
                vim.keymap.set(
                    "n",
                    "K",
                    vim.lsp.buf.hover
                )
            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            }
        }

        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        require("mason-tool-installer").setup {
            ensure_installed = ensure_installed
        }

        require("mason-lspconfig").setup {
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        capabilities,
                        server.capabilities or {}
                    )

                    require("lspconfig")[server_name].setup(server)
                end
            }
        }
    end
}
