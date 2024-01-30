return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-a-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>",    "window left" },
    { "<c-a-j>",  "<cmd><C-U>TmuxNavigateDown<cr>",    "window down" },
    { "<c-a-k>",  "<cmd><C-U>TmuxNavigateUp<cr>",      "window up" },
    { "<c-a-l>",  "<cmd><C-U>TmuxNavigateRight<cr>",   "window right" },
    { "<c-a-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
