local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here

  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support
  use 'nvim-treesitter/nvim-treesitter'

  use {
	'preservim/nerdtree',
	    setup = function()
		vim.api.nvim_set_keymap("n", "<F4>", "<cmd>NERDTreeToggle<cr>" ,{silent = true, noremap = true})
	    end
  }

  use {
    'neovim/nvim-lspconfig',
     config = function()
	require('lspconfig').gopls.setup{}
     end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

