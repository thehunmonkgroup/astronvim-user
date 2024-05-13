if os.getenv("OPENAI_API_KEY") then
  return {
    {
      "thehunmonkgroup/ChatGPT.nvim",
      lazy = false,
      dev = true,
      opts = {
        chat = {
          keymaps = {
            new_session = "<C-i>",
            select_session = "s",
          },
        },
        openai_params = {
          model = "gpt-4o",
          max_tokens = 1500,
        },
        openai_edit_params = {
          model = "gpt-4-1106-preview",
        },
        use_openai_functions_for_edits = true,
      },
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "folke/trouble.nvim",
        "nvim-telescope/telescope.nvim"
      },
    },
    {
      "Exafunction/codeium.vim",
      lazy = false,
    },
  }
else
  return {}
end
