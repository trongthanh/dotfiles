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
:set completeopt-=preview     " For No Previews
:set nowrap                   " Don't wrap line

call plug#begin()

Plug 'preservim/nerdtree' " NerdTree
Plug 'vim-airline/vim-airline' " Status bar
Plug 'Xuyuanp/nerdtree-git-plugin' " git status for nerdtree, must come before vim-devicons
Plug 'tpope/vim-surround' " Surrounding cs'` ysw)
Plug 'matze/vim-move' " Move text <M-hjkl>
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'pangloss/vim-javascript' " Better JS syntax highlight
Plug 'MaxMEllon/vim-jsx-pretty' " JSX syntax highlight
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'ryanoasis/vim-devicons' " Developer Icons
" Plug 'tc50cal/vim-terminal' " Vim Terminal
" Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi' " Multiple cursor
Plug 'editorconfig/editorconfig-vim'
Plug 'mustache/vim-mustache-handlebars'
" Fuzzy search, require `brew install fzy ripgrep`
Plug 'cloudhead/neovim-fuzzy'
Plug 'mattn/emmet-vim'

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
noremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>
" close window
noremap <M-w> <Esc>:q!<CR>
inoremap <M-w> <Esc>:q!<CR>
" quit app
noremap <M-q> <Esc>:qa!
inoremap <M-q> <Esc>:qa!

" nmap <F8> :TagbarToggle<CR>

" Visual Multi settings
let g:VM_leader = '\'
let g:VM_maps = {}
let g:VM_maps['Find Under']             = '<C-d>'
let g:VM_maps['Find Subword Under']     = '<C-d>'
let g:VM_maps["Select l"]               = '<S-Right>'     " start selecting left
let g:VM_maps["Select h"]               = '<S-Left>'      " start selecting right
let g:VM_maps["Select Cursor Down"]     = '<C-Down>'      " start selecting down
let g:VM_maps["Select Cursor Up"]       = '<C-Up>'        " start selecting up
let g:VM_mouse_mappings = 1
let g:VM_maps["Mouse Cursor"]                = '<C-RightMouse>'
let g:VM_maps["Mouse Word"]                  = '<M-LeftMouse>'
let g:VM_maps["Mouse Column"]                = '<M-C-RightMouse>'

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
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" create :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" vim-javascript, enable jsdoc highlight
let g:javascript_plugin_jsdoc = 1
