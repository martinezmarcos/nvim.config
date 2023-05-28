local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "pyright" }
})

local path = require('lspconfig/util').path

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ '*', '.*' }) do
    local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
mason_lspconfig.setup_handlers {
  function(server_name)
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }

    if server_name == "jsonls" then
      local jsonls_opts = require("user.lsp.settings.jsonls")
      opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server_name == "lua_ls" then
      local lua_ls_opts = require("user.lsp.settings.lua_ls")
      opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
    end

    if server_name == "pyright" then
      local pyright_opts = require("user.lsp.settings.pyright")
      opts = vim.tbl_deep_extend("force", pyright_opts, opts)
      opts = vim.tbl_deep_extend("force", {
        before_init = function(_, config)
          config.settings.python.pythonPath = get_python_path(config.root_dir)
        end
      }, opts)
    end

    require("lspconfig")[server_name].setup(opts)
  end
}
