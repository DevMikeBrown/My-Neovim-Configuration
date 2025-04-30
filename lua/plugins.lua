-- Auto-install packer if missing
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugins
return require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- Let packer manage itself

  -- Add plugins below:
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "neovim/nvim-lspconfig"

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
  })

  use {
    'akinsho/bufferline.nvim',
    version = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }


  -- Auto-sync after cloning packer
  if packer_bootstrap then
    require("packer").sync()
  end
end)

