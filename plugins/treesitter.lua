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
      "eex",
      "elixir",
      "erlang",
      "gitattributes",
      "gitcommit",
      "go",
      "html",
      "http",
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
      "python",
      "query",
      "ruby",
      "rust",
      "scss",
      "sql",
      "toml",
      "vim",
      "vimdoc",
      "yaml",
    })
  end,
}
