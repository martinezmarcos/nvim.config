-- [nfnl] Compiled from fnl/cfg/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local colorscheme = "everforest"
do
  local _1_, _2_ = pcall(vim.cmd, ("colorscheme " .. colorscheme))
  if ((_1_ == false) and true) then
    local _ = _2_
    vim.notify(("colorscheme " .. colorscheme .. " not found!"))
  else
  end
end
return {}
