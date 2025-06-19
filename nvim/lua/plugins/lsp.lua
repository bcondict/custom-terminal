return {
  {
    "wuelnerdotexe/vim-astro",
    opts = {
      astro_typescript = "enable",
      astro_stylus = "enable",
    },
    config = function() end,
  },
  -- tools
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "powershell-editor-services",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "eslint-lsp",
        "clangd",
        "astro-language-server",
        "sql-formatter",
        "html-lsp",
        "cpplint",

        "csharp-language-server",
        "csharpier",
        "netcoredbg",

        "json-lsp",
      })
    end,
  },
  { "hoffs/omnisharp-extended-lsp.nvim" },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        clangd = {
          settings = {
            clangd = {
              format = {
                enable = true,
              },
            },
          },
          on_attach = function(_, bufnr)
            -- Set tab-related options
            local opts = { noremap = true, silent = true }
            local set = vim.api.nvim_buf_set_option
            set(bufnr, "expandtab", false) -- Use tabs instead of spaces
            set(bufnr, "shiftwidth", 4) -- Indentation amount for `<` and `>`
            set(bufnr, "tabstop", 4) -- Number of spaces tabs count for
            set(bufnr, "softtabstop", 4) -- Number of spaces tabs count for in editing operations
          end,
        },
        omnisharp = {
          keys = {
            {
              "gd",
              LazyVim.has("telescope.nvim") and function()
                require("omnisharp_extended").telescope_lsp_definitions()
              end or function()
                require("omnisharp_extended").lsp_definitions()
              end,
              desc = "Goto Definitions",
            },
          },

          settings = {
            FormattingOptions = {
              EnableEditorConfigSupport = true, -- Ensure .editorconfig is respected
              TabSize = 4,
              TabStop = 4,
              ShiftWidth = 4,
            },
          },
          enableDecompilationSupport = true,
          enable_roslyn_analyzers = true,
          organize_imports_on_format = true,
          enable_import_completion = true,
        },
        csharp_ls = {
          settings = {
            FormattingOptions = {
              TabSize = 4,
              tabsize = 4,
              TabStop = 4,
              tabstop = 4,
              ShiftWidth = 4,
              shiftwidth = 4,
            },
          },
        },
        astro = {},
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },
}
