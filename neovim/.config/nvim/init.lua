vim.cmd([[
  autocmd FileType html :setlocal sw=2 ts=2 sts=2
  autocmd FileType lua :setlocal sw=2 ts=2 sts=2
  autocmd FileType cpp :setlocal sw=2 ts=2 sts=2
  autocmd FileType ocaml :setlocal sw=2 ts=2 sts=2
  autocmd FileType js :setlocal sw=2 ts=2 sts=2
  autocmd FileType vim :setlocal sw=2 ts=2 sts=2

  autocmd BufNewFile,BufRead *.mpp,*.mxx,*.ixx,*.cppm setfiletype cpp
  autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi setfiletype fsharp
]])

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.spelllang = 'en_ca'
vim.opt.termguicolors = true

if vim.g.vscode ~= nil then return end

-- Protect against changes between writes
vim.opt.swapfile = true
-- protect against crash-during-write
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.backupcopy = "auto"
-- persist the undo tree for each file
vim.opt.undofile = true

vim.opt.runtimepath = vim.opt.runtimepath + ",/home/adam/.opam/4.14.0/share/ocp-indent/vim,"

require 'impatient'

require 'plugins'
require 'lsp'

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Set current theme
vim.cmd("colorscheme melange")
vim.opt.guifont = "FiraCode Nerd Font Mono:h10"
