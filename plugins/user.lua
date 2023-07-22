return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "saltstack/salt-vim",
    event = "User AstroFile",
  },
  {
    "Glench/Vim-Jinja2-Syntax",
    event = "User AstroFile",
  },
  {
    "tolecnal/icinga2-vim",
    event = "User AstroFile",
  },
  {
    "nfnty/vim-nftables",
    event = "User AstroFile",
  },
  {
    "hashivim/vim-terraform",
    event = "User AstroFile",
  },
  {
    "vimoutliner/vimoutliner",
    event = "User AstroFile",
  },
  {
    "ntpeters/vim-better-whitespace",
    event = "User AstroFile",
  },
  {
    "farmergreg/vim-lastplace",
    event = "User AstroFile",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-telescope/telescope.nvim",
      -- Optional.
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('telescope').load_extension('dap')
    end,
  },
}
