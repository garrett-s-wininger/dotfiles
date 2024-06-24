return {
    {
        "numtoStr/Comment.nvim",
        event = "VimEnter",
        opts = {}
    },
    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        opts = {
            signs = false
        },
        config = function()
            vim.keymap.set(
                "n",
                "]t",
                function()
                    require("todo-comments").jump_next()
                end
            )
            vim.keymap.set(
                "n",
                "[t",
                function()
                    require("todo-comments").jump_prev()
                end
            )
        end
    },
    {
        "echasnovski/mini.nvim",
        event = "VimEnter",
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup { use_icons = vim.g.have_nerd_font }
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable "make" == 1
                end
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown()
                    }
                }
            }

            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")

            local builtin = require "telescope.builtin"
            vim.keymap.set("n", "<leader>sc", builtin.current_buffer_fuzzy_find)
            vim.keymap.set("n", "<leader>sb", builtin.buffers)
            vim.keymap.set("n", "<leader>sf", builtin.find_files)
            vim.keymap.set("n", "<leader>sg", builtin.git_files)

            vim.keymap.set("n", "<leader>sn", function()
                builtin.find_files { cwd = vim.fn.stdpath "config" }
            end)
        end,
    },
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim"
        },
        config = true
    },
    {
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
                        build = "make install_jsregexp"
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
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "luadoc", "vim", "vimdoc" },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = {}
            },
            indent = { enable = true, disable = {} }
        },
        config = function(_, opts)
            require("nvim-treesitter.install").prefer_git = true
            require("nvim-treesitter.configs").setup(opts)
        end
    }
}
