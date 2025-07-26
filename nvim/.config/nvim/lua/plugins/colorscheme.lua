return {
  -- add the theme
  { "miikanissi/modus-themes.nvim", priority = 1000 },

  -- Configure LazyVim to load the theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "modus",
    },
  }
}
