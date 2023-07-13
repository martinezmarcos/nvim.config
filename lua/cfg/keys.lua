-- [nfnl] Compiled from fnl/cfg/keys.fnl by https://github.com/Olical/nfnl, do not edit.
local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set
local function _1_()
  return print("howdy")
end
keymap("n", "<leader>hh", _1_, opts)
return {}
