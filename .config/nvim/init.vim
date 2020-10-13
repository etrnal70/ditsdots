"-------------------Vim-Plug--------------------------
call plug#begin()

" Git related plugin
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Fuzzy finder
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
"Plug 'junegunn/fzf.vim'

" Looks and feel
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'bluz71/vim-nightfly-guicolors'

" Dadbod for database plugin
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

" coc.nvim for LSP 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vimspector for debugging
Plug 'puremourning/vimspector'

" Documentation
Plug 'kkoomen/vim-doge'

" Telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Misc plugins
Plug 'liuchengxu/vista.vim'
Plug 'pacha/vem-tabline'
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'Chiel92/vim-autoformat'
Plug 'tyru/open-browser.vim'

" Language-specific plugin
Plug 'dart-lang/dart-vim-plugin'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'previm/previm'
Plug 'skanehira/preview-uml.vim'

call plug#end()


"---------------KEYBOARD MAPPING---------------------
map <F2> :LuaTreeToggle<CR>
map <F1> :Vista!!<CR>

let mapleader = ","
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

nnoremap <A-k> :resize +2<CR>
nnoremap <A-j> :resize -2<CR>
nnoremap <A-h> :vertical resize -2<CR>
nnoremap <A-l> :vertical resize +2<CR>

inoremap <A-l> <esc>la
inoremap <A-h> <esc>i

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
set relativenumber
set updatetime=300
set pumheight=5
set completeopt=longest,menuone
set hidden
set backspace=indent,eol,start
filetype plugin indent on

let $FZF_DEFAULT_COMMAND = 'rg'
"--------------------THEME-----------------------

set termguicolors
colorscheme nightfly
set background=dark

" Make vim respect terminal color 
highlight Normal guibg=none
highlight NonText guibg=none

"Hide tilde sign for empty line
set fcs=eob:\  

" Disable vertical split
hi VertSplit ctermbg=NONE guibg=NONE

"============= Load File ===================
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/plugins.vim
