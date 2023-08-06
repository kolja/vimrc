local provider = {
    full = vim.empty_dict(),
    legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
            "comment",
            "excluded_code",
            "identifier",
            "keyword",
            "keyword_control",
            "number",
            "operator",
            "operator_overloaded",
            "preprocessor_keyword",
            "string",
            "whitespace",
            "text",
            "static_symbol",
            "preprocessor_text",
            "punctuation",
            "string_verbatim",
            "string_escape_character",
            "class_name",
            "delegate_name",
            "enum_name",
            "interface_name",
            "module_name",
            "struct_name",
            "type_parameter_name",
            "field_name",
            "enum_member_name",
            "constant_name",
            "local_name",
            "parameter_name",
            "method_name",
            "extension_method_name",
            "property_name",
            "event_name",
            "namespace_name",
            "label_name",
            "xml_doc_comment_attribute_name",
            "xml_doc_comment_attribute_quotes",
            "xml_doc_comment_attribute_value",
            "xml_doc_comment_cdata_section",
            "xml_doc_comment_comment",
            "xml_doc_comment_delimiter",
            "xml_doc_comment_entity_reference",
            "xml_doc_comment_name",
            "xml_doc_comment_processing_instruction",
            "xml_doc_comment_text",
            "xml_literal_attribute_name",
            "xml_literal_attribute_quotes",
            "xml_literal_attribute_value",
            "xml_literal_cdata_section",
            "xml_literal_comment",
            "xml_literal_delimiter",
            "xml_literal_embedded_expression",
            "xml_literal_entity_reference",
            "xml_literal_name",
            "xml_literal_processing_instruction",
            "xml_literal_text",
            "regex_comment",
            "regex_character_class",
            "regex_anchor",
            "regex_quantifier",
            "regex_grouping",
            "regex_alternation",
            "regex_text",
            "regex_self_escaped_character",
            "regex_other_escape",
        },
    },
    range = true,
}

local on_attach = function(client, bufnr)

    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    -- vim.keymap.set("i", "<C-i>", function() vim.lsp.buf.hover() end, opts) -- messes with tab somehow
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("i", "<C-k>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>w", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>D", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>R", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>r", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "==", function() vim.lsp.buf.format() end, opts)

    -- Hacky workaround. Hopefully remove soon.
    if client.name == "omnisharp" then
        client.server_capabilities.semanticTokensProvider = provider
    end
end

local ensure_installed = { "lua_ls", "tsserver", "rust_analyzer", "omnisharp_mono" }

return {

    {
        'williamboman/mason.nvim',
        config = true
    },

    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = ensure_installed
        }
    },
    {
        'neovim/nvim-lspconfig',
        event = "BufReadPre",
        dependencies = {
            'mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp'
        },

        config = function()
            local lspconfig = require('lspconfig')
            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed
            })
            -- Add additional capabilities supported by nvim-cmp
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            lspconfig.rust_analyzer.setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = {}
                }
            }

            lspconfig.tsserver.setup {
                on_attach = on_attach
            }

            lspconfig.tailwindcss.setup {}

            lspconfig.emmet_ls.setup({
              -- on_attach = on_attach,
              capabilities = capabilities,
              filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
              init_options = {
                html = {
                  options = {
                    -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                    -- ["bem.enabled"] = true,
                  },
                },
              }
            })
            -- local omnisharp_bin = "/users/kolja/.local/share/nvim/mason/packages/omnisharp-mono/omnisharp/omnisharp.exe"
            -- local omnisharp_bin = "/opt/homebrew/cellar/omnisharp-mono/1.35.3/libexec/omnisharp.exe"
            -- local mono = "/opt/homebrew/bin/mono"
            -- local pid = vim.fn.getpid()

            lspconfig.omnisharp.setup {
                -- cmd = {mono, omnisharp_bin, "--languageserver", "--hostpid", tostring(pid)},
                -- filetypes = {'cs'},
                use_mono = true,
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
                on_attach = on_attach,
            }

            -- lspconfig.omnisharp_mono.setup {
            --     -- cmd = {bin, '-lsp', '-hpid', pid},
            --     -- filetypes = {'cs'},
            --     use_mono = true,
            --     capabilities = capabilities,
            --     root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln"),
            --     on_attach = on_attach
            -- }

            local runtime_path = vim.split(package.path, ";")
            table.insert(runtime_path, "lua/?.lua")
            table.insert(runtime_path, "lua/?/init.lua")

            lspconfig['lua_ls'].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = runtime_path,
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end
    },

}
