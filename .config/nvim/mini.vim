call plug#begin()

Plug 'neovim/nvim-lspconfig'    
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'

Plug 'nvim-lua/popup.nvim'          
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

Plug 'ryanoasis/vim-devicons'       
Plug 'kyazdani42/nvim-web-devicons'
Plug 'jsit/toast.vim'

Plug 'nvim-treesitter/nvim-treesitter'     
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'puremourning/vimspector'      

Plug 'kkoomen/vim-doge'             

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

"===============FIXME:Config================
"completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" Omnifunc
set omnifunc=v:lua.vim.lsp.onmifunc

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_matching_smart_case = 1
let g:completion_trigger_character = ['.', '::']

"============= Load File ===================
source ~/.config/nvim/plugins/keymaps.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/statusline.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/vim-move.vim
