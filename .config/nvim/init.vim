call plug#begin()

" Git related plugin
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Looks and feel
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jsit/toast.vim'

" Dadbod for database plugin
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
" Plug 'kristijanhusak/vim-dadbod-completion'

" coc.nvim for LSP 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Vimspector for debugging
Plug 'puremourning/vimspector'

" Documentation
Plug 'kkoomen/vim-doge'

" Misc plugins
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'itchyny/lightline.vim'
Plug 'jsfaint/gen_tags.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'

" Language-specific plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'mhinz/vim-crates'

call plug#end()

"---------------GENERAL SETTINGS--------------------
set encoding=utf-8
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
set completeopt=longest,menuone
set nofoldenable
set backspace=indent,eol,start
filetype plugin indent on

"------------------SOURCE-------------------------
source ~/.config/nvim/plugins/keymaps.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/statusline.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/coc-fzf.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/vimspector.vim
source ~/.config/nvim/plugins/dadbod.vim
source ~/.config/nvim/plugins/crates.vim
source ~/.config/nvim/plugins/vim-move.vim
source ~/.config/nvim/plugins/gen-tags.vim
