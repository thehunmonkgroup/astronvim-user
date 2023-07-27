-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()

  ------------------------------------------
  -- Codium customizations.
  ------------------------------------------
  local codeium_ignore_filetypes = {
    ["votl"] = false,
    ["markdown"] = false,
  }
  vim.g.codeium_filetypes = codeium_ignore_filetypes
  vim.g.codeium_no_map_tab = true

  ------------------------------------------
  -- Floating diagnostics message autocmd
  ------------------------------------------
  vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    pattern = "*",
    callback = function()
      vim.diagnostic.open_float({focus=false})
    end,
  })

  -------------------------------------------------
  -- Disable modelines for Taskwarrior data files.
  -------------------------------------------------
  vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
    pattern = "*.task",
    callback = function()
      vim.o.modelines = 0
    end,
  })

  -------------------------------------------------
  -- Set votl filetype for .otl files.
  -------------------------------------------------
  vim.api.nvim_create_autocmd({"BufEnter", "BufReadPost"}, {
    pattern = "*.otl",
    callback = function()
      vim.bo.filetype = "votl"
    end,
  })

  ----------------------------------------------------
  -- Close all buffers except the currently open one.
  ----------------------------------------------------
  function _G.delete_hidden_buffers(force)
    local buffers = vim.api.nvim_list_bufs()
    for _, buffer in ipairs(buffers) do
      if vim.fn.buflisted(buffer) and vim.fn.bufwinnr(buffer) == -1 then
        if not force then
          vim.api.nvim_command("bwipeout " .. buffer)
        else
          vim.api.nvim_command("bwipeout! " .. buffer)
        end
      end
    end
  end

  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }
end
