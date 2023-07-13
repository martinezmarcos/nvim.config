-- [nfnl] Compiled from fnl/cfg/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
do
  local _1_, _2_ = pcall(require, "lualine")
  if ((_1_ == false) and true) then
    local _ = _2_
    return
  elseif ((_1_ == true) and (nil ~= _2_)) then
    local lualine = _2_
    local branch = {"branch", icons_enabled = true, icon = "\238\156\165"}
    local filetype = {"filetype", icon = nil, icons_enabled = false}
    local diff
    local function _3_()
      return (vim.fn.winwidth(0) > 80)
    end
    diff = {"diff", symbols = {added = "\239\145\151 ", modified = "\239\145\153", removed = "\239\145\152"}, cond = _3_, colored = false}
    local function progress()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = {"__", "\226\150\129\226\150\129", "\226\150\130\226\150\130", "\226\150\131\226\150\131", "\226\150\132\226\150\132", "\226\150\133\226\150\133", "\226\150\134\226\150\134", "\226\150\135\226\150\135", "\226\150\136\226\150\136"}
      local line_ratio = (current_line / total_lines)
      local index = math.ceil((line_ratio * #chars))
      return chars[index]
    end
    lualine.setup({options = {icons_enabled = true, theme = "auto", component_separators = {left = "", right = ""}, section_separators = {left = "", right = ""}, disable_filetypes = {"dashboard", "NvimTree", "Outline"}}, always_divide_middle = true, sections = {lualine_a = {"mode"}, lualine_b = {branch}, lualine_c = {}, lualine_x = {diff, "encoding", filetype}, lualine_y = {"location"}, lualine_z = {progress}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {"filename"}, lualine_x = {"location"}, lualine_y = {}, lualine_z = {}, tabline = {}}})
  else
  end
end
return {}
