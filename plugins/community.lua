return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  {
    "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = { -- :h background
          light = "latte",
          dark = "macchiato",
      },
      dim_inactive = {
          enabled = true, -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = { "italic" },
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
      },
      integrations = {
        aerial = true,
        mason = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        neotree = true,
        cmp = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        notify = true,
        treesitter = true,
        telescope = {
          enabled = true,
          style = "nvchad"
        },
        which_key = true,
        mini = true,
        markdown = true,
      },
    },
  },
  { import = "astrocommunity.colorscheme.gruvbox-nvim", enabled = true },
  {
    "gruvbox.nvim",
    opts = {
      italic = {
        strings = true,
        comments = true,
        folds = true,
        operations = false,
      }
    }
  }
}
