call plug#begin()
"Git related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Looks and feel
Plug 'ryanoasis/vim-devicons'
Plug 'jsit/toast.vim'

"Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" coc.nvim for LSP 
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Misc plugins
Plug 'itchyny/lightline.vim'
Plug 'matze/vim-move'
Plug 'jiangmiao/auto-pairs'
Plug 'Chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'

" Language-specific plugin
Plug 'mhinz/vim-crates'

call plug#end()

let mapleader=","
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
set completeopt=longest,menuone
set nofoldenable
set backspace=indent,eol,start
set pumheight=5
filetype plugin indent on

augroup toast 
  autocmd colorscheme toast hi clear CocHintSign | hi link CocHintSign Comment
augroup end

colorscheme toast
set background=dark
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn ctermbg=NONE guibg=NONE


if !has('gui_running')
  set t_Co=256
endif

"-------------------Keymaps--------------------
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


"----------------------CoC---------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"================Vim-Move======================
let g:move_key_modifier = 'A-S'

"===============STATUSLINE=====================
function! FileNameWithIcon() abort
  return winwidth(0) > 70  ?  WebDevIconsGetFileTypeSymbol() . ' ' . expand('%:t') : '' 
endfunction

function! FileNameWithParent(f) abort
  if expand('%:t') ==# ''
    return expand('%:p:h:t')
  else
    return expand('%:p:h:t') . "/" . expand("%:t")
  endif
endfunction

function! Git_branch() abort
  if fugitive#head() !=# ''
    return   " " . fugitive#head()
  else
    return "\uf468"
  endif
endfunction

function! ErrorStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if get(info, 'error', 0)
    return info['error'] . "  🛑"
  endif

  return "0  🛑"
endfunction 

function! WarningStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if get(info, 'warning', 0)
    return info['warning'] . "  ⚠️"
  endif

  return "0  ⚠️"
endfunction 

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:bg = ["NONE", "NONE"] 
let s:fg = ["NONE", 7]
let s:fgn = ["NONE", 0]
let s:bn = ["#98c379", 51]
let s:bi = ["#61afef", 82]
let s:br = ["#e06c75", 11]
let s:bv = ["#e5c07b", 9]


let s:p.normal.middle = [ [ s:fg, s:bg ] ]
let s:p.normal.right = [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]
let s:p.normal.warning = [ [ s:fg, s:bv ] ]
let s:p.normal.error = [ [ s:fg, s:bv ] ]

let s:p.inactive.left =  [ [ s:fgn, s:bg ], [ s:fg, s:bg ] ]
let s:p.inactive.middle = [ [ s:fg, s:bg ] ]
let s:p.inactive.right = [ [ s:fg, s:bg ], [ s:fg, s:bg ] ]

let s:p.normal.left = [ [ s:bn, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.insert.left = [ [ s:bi, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.replace.left = [ [ s:br, s:bg, 'bold' ], [ s:fg, s:bg ] ]
let s:p.visual.left = [ [ s:bv, s:bg, 'bold' ], [ s:fg, s:bg ] ]

let s:p.tabline.left = [ [ s:fg, s:bg ] ]
let s:p.tabline.middle = [ [ s:fg, s:bg ] ]
let s:p.tabline.right = [ [ s:fg, s:bg ] ]
let s:p.tabline.tabsel = [ [ s:bg, s:fg ] ]

let g:lightline#colorscheme#minimal#palette = lightline#colorscheme#flatten(s:p)

"=======================================================================================
" Taking inspiration from https://github.com/juacq97/dotfiles/blob/master/minimal.vim
let g:lightline = { 'colorscheme' : 'minimal' }
let g:lightline.active = { 
      \ 'left': [ ['mode', 'readonly'],['git_branch'], ['filename_with_icon', 'modified']],
      \ 'right': [['lineinfo'], ['testing_status', 'error_diagnostic', 'warning_diagnostic'] ]
      \ }
" let g:lightline.separator = { 'left': "  ", 'right': "  " }
let g:lightline.subseparator = { 'left': '', 'right': '' }
" let g:lightline.tabline_separator = { 'left': " ", 'right': "" }
" let g:lightline.tabline_subseparator = { 'left': "|", 'right': "|" }

let g:lightline.tabline = {'left': [ [ 'vim_logo'], [ 'tabs' ] ]}
let g:lightline.tab = {
        \ 'active': ['filename_with_parent'],
        \ 'inactive': ['filename']
        \ }

let g:lightline.tab_component = {}
let g:lightline.tab_component_function = {
            \ 'artify_filename': 'lightline_tab_filename',
            \ 'filename': 'lightline#tab#filename',
            \ 'modified': 'lightline#tab#modified',
            \ 'readonly': 'lightline#tab#readonly',
            \ 'tabnum': 'lightline#tab#tabnum',
            \ 'filename_with_parent': 'FileNameWithParent'
            \ }

let g:lightline.component = {
        \ 'filename_with_icon': '%{FileNameWithIcon()}',
        \ 'vim_logo': "\ue7c5 ",
        \ 'git_branch': '%{Git_branch()}',
        \ 'filename_with_parent': '%t',
        \ 'warning_diagnostic' : '%{WarningStatus()}',
        \ 'error_diagnostic' : '%{ErrorStatus()}',
        \ }

"===================================== LUA ===========================================
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "c", "rust", "cpp",  "dart", "verilog", "bash", "toml" , "lua", "css", "html", "typescript", "javascript", "json"
  },
  highlight = {
    enable = true, 
    use_languagetree = true,
    disable = {},  
  },
  textobjects = {
    select = {
      enable = true,
        keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["as"] = "@statement.outer",
        ["am"] = "@statement.outer",
        }
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  }
}

require('telescope').load_extension('fzy_native')

local tele = require('telescope')

vim.cmd[[noremap <silent><C-f> <cmd>lua require'telescope.builtin'.find_files{}<CR>]]
vim.cmd[[nnoremap <silent><C-p> <cmd>lua require'telescope.builtin'.git_files{}<CR>]]
vim.cmd[[noremap <silent><Leader>ls <cmd>lua require'telescope.builtin'.live_grep{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lb <cmd>lua require'telescope.builtin'.buffers{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lt <cmd>lua require'telescope.builtin'.treesitter{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lq <cmd>lua require'telescope.builtin'.quickfix{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lh <cmd>lua require'telescope.builtin'.oldfiles{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lm <cmd>lua require'telescope.builtin'.marks{}<CR>]]
vim.cmd[[nnoremap <silent><Leader>lg <cmd>lua require'telescope.builtin'.git_commits{}<CR>]]

tele.setup{
  defaults = {
    extensions = {
	fzy_native = {
	    override_generic_sorter = false,
            override_file_sorter = true,
	}
    },
    vimgrep_arguments = {
      'rg',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    -- Let's try buffer preview for fanciness
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new, 
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    --
    prompt_prefix= " 🔍 ",
    color_devicons = true,
    layout_strategy = "flex",
    preview_cutoff = 120,
    windblend = 0.2,
    results_height = 1,
    results_width = 0.8,
    file_ignore_patterns = {"__pycache__/*","__init__.py", "%.env", "node_modules/*", "scratch/.*"},
    file_sorter = require'telescope.sorters'.get_fuzzy_file,
    generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
    set_env = {['COLORTERM'] = 'truecolor'},
    shorten_path = true,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  }
}

EOF
