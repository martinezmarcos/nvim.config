(local colorscheme :everforest)

(match (pcall vim.cmd (.. "colorscheme " colorscheme))
  (false _) (vim.notify (.. "colorscheme " colorscheme " not found!")))

{}
