local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

which_key.register {
  ["<leader>b"] = {
    name = "+buffer"
  }
}

which_key.register {
  ["<leader>f"] = {
    name = "+find"
  }
}

which_key.register {
  ["<leader>g"] = {
    name = "+git"
  }
}

which_key.register {
  ["<leader>w"] = {
    name = "+window"
  }
}

which_key.setup {}
