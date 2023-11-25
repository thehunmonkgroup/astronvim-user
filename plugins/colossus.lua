if os.getenv("OPENAI_API_KEY") then
  return {
    {
      "thehunmonkgroup/ChatGPT.nvim",
      lazy = false,
      dev = true,
      opts = {
        openai_params = {
          model = "gpt-4-1106-preview",
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
