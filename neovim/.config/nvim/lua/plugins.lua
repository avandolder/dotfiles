vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'nvim-lua/plenary.nvim'
  use 'sheerun/vim-polyglot'
  use { 'ibhagwan/fzf-lua', branch = 'main' }
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
        }
      }
    end
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/impatient.nvim'
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = " ",
      }
    end
  }
  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end
  }
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use 'neovim/nvim-lspconfig'
  use 'tamago324/nlsp-settings.nvim'
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer').setup {}
    end
  }
  use {
    'stevearc/dressing.nvim',
    config = function()
      require('dressing').setup {}
    end
  }
  use 'rcarriga/nvim-notify'

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'p00f/nvim-ts-rainbow',
    },
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = 'all',
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = 40000,
        },
      }

      vim.cmd([[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
      ]])
    end
  }

  use {
    "folke/twilight.nvim",
    requires = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require("twilight").setup {}
    end
  }

  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }

  use {
    'Xuyuanp/scrollbar.nvim',
    config = function()
      vim.cmd([[
        augroup ScrollbarInit
          autocmd!
          autocmd WinScrolled,VimResized,QuitPre * silent! lua require('scrollbar').show()
          autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
          autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
        augroup end
      ]])
    end
  }

  use {
    'roxma/nvim-yarp',
    run = '!pip install -r requirements.txt',
  }
  use {
    'nixprime/cpsm',
    config = function()
      vim.cmd([[
       let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
      ]])
    end
  }
  use {
    'gelguy/wilder.nvim',
    config = function()
      require 'wilderconfig'
    end
  }

  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    config = function()
      vim.g.coq_settings = { ['display.pum.fast_close'] = false }
      vim.g.coq_settings = { auto_start = 'shut-up' }
    end
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = 'artifacts'
  }
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps',
    config = function()
      vim.cmd([[
        nnoremap <leader>v <cmd>CHADopen<cr>
        nnoremap <leader>l <cmd>call setqflist([])<cr>
      ]])
    end
  }

  use 'simrat39/rust-tools.nvim'
  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      local crates = require 'crates'
      crates.setup {
        src = {
          coq = {
            enabled = true,
            name = "crates.nvim",
          },
        },
      }

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
      vim.keymap.set('n', '<leader>cr', crates.reload, opts)

      vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
      vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)

      vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
      vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
      vim.keymap.set('n', '<leader>ca', crates.update_all_crates, opts)
      vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
      vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)
      vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, opts)

      vim.keymap.set('n', '<leader>cH', crates.open_homepage, opts)
      vim.keymap.set('n', '<leader>cR', crates.open_repository, opts)
      vim.keymap.set('n', '<leader>cD', crates.open_documentation, opts)
      vim.keymap.set('n', '<leader>cC', crates.open_crates_io, opts)
    end,
  }

  use 'p00f/clangd_extensions.nvim'

  use 'tpope/vim-obsession'
  use {
    'dhruvasagar/vim-prosession',
    requires = 'tpope/vim-obsession',
    config = function()
      vim.g.prosession_dir = '~/.local/share/nvim/session'
    end
  }

  use 'tpope/vim-abolish'

  -- Theme
  use {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "bold",
          }
        }
      })
    end
  }

  use {
    'sainnhe/sonokai',
    config = function()
      vim.cmd([[
        let g:sonokai_style = 'espresso'
        let g:sonokai_better_performance = 1
      ]])
    end
  }

  use 'savq/melange'
end)
