local util = require("user.util")

local LSP_PACKAGES = {
  "bashls",
  "jsonls",
  "lua_ls",
}
local LSP_COLOSSUS_PACKAGES = {
  'cssls',
  'elixirls',
  'html',
  'intelephense',
  'pylsp',
  'solargraph',
  'tsserver',
  'yamlls',
}
local DAP_PACKAGES = {
}
local DAP_COLOSSUS_PACKAGES = {
  'bash',
  'php',
  'python',
}
if os.getenv("IS_COLOSSUS") then
  for _, package in ipairs(LSP_COLOSSUS_PACKAGES) do
    table.insert(LSP_PACKAGES, package)
  end
  for _, package in ipairs(DAP_COLOSSUS_PACKAGES) do
    table.insert(DAP_PACKAGES, package)
  end
end

-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, LSP_PACKAGES)
    end,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        -- "prettier",
        -- "stylua",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, DAP_PACKAGES)
      opts.handlers = {
        function(config)
          -- all sources with no handler get passed here
          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        php = function(config)
          config.adapters = {
            type = 'executable',
            command = 'node',
            args = { util.get_mason_package_install_path("php-debug-adapter") .. "/extension/out/phpDebug.js" },
          }
          config.configurations = {
            {
              type = 'php',
              request = 'launch',
              name = 'Listen for xdebug',
              port = '9000',
              log = true,
              serverSourceRoot = "/var/local/git/my.al-dev.com",
              localSourceRoot = "/home/hunmonk/git/apartmentlines/apartmentlines.com",
            }
          }
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
        python = function(config)
          -- Set justMyCode = false on all configurations, default is true.
          for _, c in ipairs(config.configurations) do
            c.justMyCode = false
          end
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      }
    end,
  },
}
