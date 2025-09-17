-- Expert LSP for Elixir (minimal, no lang.elixir extra)

return {
  -- Expert LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lexical = {
          mason = false,
          cmd = { "/Users/bretfunk/.local/bin/expert" },
          filetypes = { "elixir", "eelixir", "heex" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
          end,
          settings = {},
        },
      },
    },
  },

  -- Add Elixir to treesitter (only if you need syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir", "heex" })
    end,
  },
}