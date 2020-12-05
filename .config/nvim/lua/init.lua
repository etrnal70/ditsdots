local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  if vim.fn.input("Download Packer? (y for yes)") ~= "y" then
    return
  end

  local directory = string.format(
    '%s/site/pack/packer/opt/',
    vim.fn.stdpath('data')
  )

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(string.format(
    'git clone %s %s',
    'https://github.com/wbthomason/packer.nvim',
    directory .. '/packer.nvim'
  ))

  print(out)
  print("Downloading packer.nvim...")

  return
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

  -- Plugins List
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP Plugins
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'nvim-lua/lsp-status.nvim'
  
  -- Completion
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use 'nvim-treesitter/completion-treesitter'
  -- use 'SirVer/ultisnips'
  -- use 'honza/vim-snippets'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Telescope
  use 'nvim-lua/popup.nvim'    
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/telescope.nvim'

  -- Theme and Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'jsit/toast.vim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Documentation
  use 'kkoomen/vim-doge'

  -- Git
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'

  -- Misc
  -- use 'ervandew/supertab'
  use 'kyazdani42/nvim-tree.lua'
  use 'itchyny/lightline.vim'
  use 'jsfaint/gen_tags.vim'
  use 'matze/vim-move'
  use 'jiangmiao/auto-pairs'
  use 'mhinz/vim-crates'
end
)
