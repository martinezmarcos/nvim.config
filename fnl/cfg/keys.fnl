(local opts {:noremap true :silent true})

(local keymap vim.keymap.set)

(keymap :n :<leader>hh (fn [] (print :howdy)) opts)
{}
