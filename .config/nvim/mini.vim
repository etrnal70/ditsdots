call plug#begin()

" LSP
Plug 'neovim/nvim-lspconfig'    
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'nvim-treesitter/completion-treesitter'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/lsp-status.nvim'

" Git related plugin
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'          
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Theme
Plug 'ryanoasis/vim-devicons'       
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jsit/toast.vim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter'     
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Debugger
Plug 'puremourning/vimspector'      

" Documentation
Plug 'kkoomen/vim-doge'             

" Misc plugins
Plug 'itchyny/lightline.vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-crates'

call plug#end()

"---------------GENERAL SETTINGS--------------------
set encoding=utf-8
set hidden
set wildmenu
set wildoptions=pum
set lazyredraw
set ttyfast
set clipboard+=unnamedplus
set mouse=nicr
set autoindent
set breakindent
set breakindentopt=shift:2,min:40,sbr
set formatoptions=l
set lbr
set smartindent
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set laststatus=2
set number relativenumber
set updatetime=300
set pumheight=5
set nofoldenable
set backspace=indent,eol,start
filetype plugin indent on

"============= Load File ===================
source ~/.config/nvim/plugins/keymaps.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/min-statusline.vim
luafile ~/.config/nvim/lua/treesitter.lua
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vim-move.vim
source ~/.config/nvim/plugins/crates.vim
