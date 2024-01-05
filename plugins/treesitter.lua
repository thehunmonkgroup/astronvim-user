return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.indent = vim.tbl_deep_extend("force", opts.indent, {
      enable = false,
    })
    opts.sync_install = not os.getenv("IS_COLOSSUS") and true or false
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "bash",
      "c",
      "comment",
      "css",
      "dockerfile",
      "eex",
      "elixir",
      "erlang",
      "gitattributes",
      "gitcommit",
      "go",
      "hcl",
      "html",
      "http",
      "ini",
      "javascript",
      "jq",
      "json",
      "json5",
      "lua",
      "make",
      "markdown",
      "perl",
      "php",
      "phpdoc",
      "properties",
      "python",
      "query",
      "rst",
      "ruby",
      "rust",
      "scss",
      "sql",
      "terraform",
      "toml",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    })
  end,
}
