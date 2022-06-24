:set number                   " show line number 
:set autoindent               " auto indent when enter
:set tabstop=2                " length of a \t
:set shiftwidth=2             " width of code indent
:set smarttab                 " use tab charater base on previous indent tab
:set expandtab                " indent with space
:set mouse=a                  " enable mouse
" :set clipboard+=unnamedplus   " copy paste with clipboard
:set listchars=tab:>·,trail:~,extends:>,precedes:< "space:·
:set list                     " show hidden chars
" :set completeopt-=preview     " For No Previews
:set nowrap                   " Don't wrap line
:set updatetime=300           " For faster git gutter refresh

call plug#begin()

Plug 'preservim/nerdtree' " NerdTree
Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'vim-airline/vim-airline' " Status bar
Plug 'Xuyuanp/nerdtree-git-plugin' " git status for nerdtree, must come before vim-devicons
Plug 'airblade/vim-gitgutter' " Git gutter
Plug 'petertriho/nvim-scrollbar' " Scroll bar with gutter highlight
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'ray-x/starry.nvim' " Mariana, Dracular, Monokai... with italic styles
Plug 'tpope/vim-surround' " Surrounding cs'` ysw)
Plug 'matze/vim-move' " Move text <M-hjkl>
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'pangloss/vim-javascript' " Better JS syntax highlight
Plug 'MaxMEllon/vim-jsx-pretty' " JSX syntax highlight
" Plug 'tc50cal/vim-terminal' " Vim Terminal
" Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi' " Multiple cursor
Plug 'editorconfig/editorconfig-vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'cloudhead/neovim-fuzzy' " Fuzzy search, require `brew install fzy ripgrep`
Plug 'mattn/emmet-vim' " Emmet
Plug 'ryanoasis/vim-devicons' " Developer Icons

set encoding=UTF-8

call plug#end()

:colorscheme oceanicnext

nnoremap <C-p>   :FuzzyOpen<CR>
nnoremap <C-f>   :NERDTreeFocus<CR>
nnoremap <C-e>   :NERDTree<CR>
nnoremap <C-b>   :NERDTreeToggle<CR>
nnoremap <M-r>   :NERDTreeFind<CR>
nnoremap <C-l>   :call CocActionAsync('jumpDefinition')<CR>

" save shortcut
noremap <M-s> <Esc>:w<CR>
inoremap <M-s> <Esc>:w<CR>
" close window
noremap <M-w> <Esc>:q!<CR>
inoremap <M-w> <Esc>:q!<CR>
" quit app, prompt enter to confirm
noremap <M-q> <Esc>:qa!
inoremap <M-q> <Esc>:qa!
" ctrl-c copy
vnoremap <C-c> "+y<CR>
" scroll horizontal with Shift
nnoremap <S-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <S-ScrollWheelDown> <ScrollWheelRight>

" nmap <F8> :TagbarToggle<CR>

" Visual Multi settings
let g:VM_leader = '\'
let g:VM_maps = {}
let g:VM_maps['Find Under']             = '<C-d>'
let g:VM_maps['Find Subword Under']     = '<C-d>'
let g:VM_maps["Select l"]               = '<S-Right>'     " start selecting left
let g:VM_maps["Select h"]               = '<S-Left>'      " start selecting right
let g:VM_maps["Select Cursor Up"]       = '<C-Up>'        " start selecting up
let g:VM_maps["Select Cursor Down"]     = '<C-Down>'      " start selecting down
let g:VM_mouse_mappings = 1
let g:VM_maps["Mouse Cursor"]                = '<S-LeftMouse>'
let g:VM_maps["Mouse Word"]                  = '<C-RightMouse>'
let g:VM_maps["Mouse Column"]                = '<S-RightMouse>'

" gitgutter
let g:gitgutter_sign_added = '│'      " look nicer and signal by color
let g:gitgutter_sign_modified = '│'   " look nicer and signal by color

" show hidden files in NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMouseMode = 2             " click to open folder, d-click to open file
let NERDTreeIgnore = [
\ '\.git$[[dir]]',
\ '\.sass-cache$[[dir]]',
\ 'node_modules$[[dir]]',
\ '\.lighthouseci$',
\ '\.linaria-cache$[[dir]]',
\ '\.DS_Store',
\ 'package-lock\.json',
\ 'yarn\.lock'
\]

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    " \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" airline
let g:airline#extensions#tabline#enabled = 1 " replace default tabline with airline's
let g:airline#extensions#tabline#show_tab_type = 0 " omit the tab type label
let g:airline#extensions#tabline#show_buffers = 0 " don't open use multiple buffers in one tabs
let g:airline#extensions#hunks#enabled = 1 " show git change summary
let g:airline#extensions#hunks#non_zero_only = 1 " don't show zero hunks
" let g:airline_theme = 'oceanicnext'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" devicons
let g:WebDevIconsOS = 'Darwin'

" create :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" vim-javascript, enable jsdoc highlight
let g:javascript_plugin_jsdoc = 1

" setup lua plugins
lua << EOF
require("scrollbar").setup({
  handle = {
    color = "#292e42",
  },
  marks = {
    Search = { color = "#ff9e64"},
    Error = { color = "#db4b4b"},
    Warn = { color = "#e0af68"},
    Info = { color = "#0db9d7"},
    Hint = { color = "#1abc9c"},
    Misc = { color = "#9d7cd8"},
  }
})
EOF

