if os.getenv("OPENAI_API_KEY") then
  return {
    {
      "thehunmonkgroup/ChatGPT.nvim",
      lazy = false,
      opts = {
        openai_params = {
          model = "gpt-4",
          max_tokens = 600,
        },
        openai_edit_params = {
          model = "code-davinci-edit-001",
        },
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
