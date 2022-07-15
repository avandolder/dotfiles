local lsp = require 'lspconfig'
local coq = require 'coq'

-- Add keymaps for lsp functionality
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  local function show_documentation()
    local filetype = vim.bo.filetype
    if vim.tbl_contains({ 'vim', 'help' }, filetype) then
      vim.cmd('h ' .. vim.fn.expand('<cword>'))
    elseif vim.tbl_contains({ 'man' }, filetype) then
      vim.cmd('Man ' .. vim.fn.expand('<cword>'))
    elseif vim.fn.expand('%:t') == 'Cargo.toml' then
      require('crates').show_popup()
    else
      vim.lsp.buf.hover()
    end
  end

  vim.keymap.set('n', 'K', show_documentation, bufopts)
end


lsp.fsautocomplete.setup(coq.lsp_ensure_capabilities {
  cmd = { 'dotnet', '/home/adam/app/fsac/fsautocomplete.dll', '--background-service-enabled' },
  on_attach = on_attach
})
-- lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.vimls.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.pyright.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.cmake.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.ocamllsp.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.denols.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
-- lsp.clangd.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.taplo.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.jsonls.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })
lsp.vimls.setup(coq.lsp_ensure_capabilities { on_attach = on_attach })

lsp.sumneko_lua.setup(coq.lsp_ensure_capabilities {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim', 'love' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
    format = {
      enable = true,
      -- Put format options here
      -- NOTE: the value should be STRING!!
      indent_size = 2,
    },
  },
})

require('rust-tools').setup {
  server = coq.lsp_ensure_capabilities {
    on_attach = on_attach,
  }
}

require('clangd_extensions').setup {
  server = coq.lsp_ensure_capabilities {
    on_attach = on_attach,
  }
}
