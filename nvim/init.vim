:set number relativenumber    " show line number
:set autoindent               " auto indent when enter
:set tabstop=2                " length of a \t
:set shiftwidth=2             " width of code indent
:set smarttab                 " use tab charater base on previous indent charater
:set expandtab                " indent with space
:set mouse=a                  " enable mouse
:set mousescroll=ver:1,hor:4
" :set clipboard+=unnamedplus   " register use clipboard
:set listchars=tab:‣─,trail:~,extends:›,precedes:‹ " space:·
:set list                     " show hidden chars
:set nowrap                   " Don't wrap line, see shortcut to toggle wrap below
:set updatetime=300           " For faster git gutter refresh
:set ignorecase               " ignore case during search
:set splitright               " vsplit new window to the right of current one
:set splitbelow               " split new window below current one
:set title                    " set terminal title
:set colorcolumn=+1           " show column limit when textwidth is defined

call plug#begin()

"""" UI enhancement
Plug 'nvim-tree/nvim-web-devicons'     " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'         " NvimTree plugin
Plug 'nvim-lualine/lualine.nvim'       " Status bar
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' } " Bufferline
Plug 'airblade/vim-gitgutter'          " Git gutter
Plug 'tpope/vim-fugitive'              " Git inside vim
Plug 'petertriho/nvim-scrollbar'       " Scroll bar with gutter highlight
" Plug 'tc50cal/vim-terminal'          " Vim Terminal
" Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'sainnhe/sonokai'                 " Sonokai colorscheme
Plug 'mhartington/oceanic-next'        " Oceanic Next scheme
Plug 'joshdick/onedark.vim'            " OneDark color scheme

"""" Motion and shortcuts
Plug 'tpope/vim-surround'                  " Surrounding cs'` ysw)
Plug 'matze/vim-move'                      " Move text <S-hjkl>
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide
Plug 'tpope/vim-commentary'                " For Commenting gcc & gc
Plug 'mg979/vim-visual-multi'              " Multiple cursor
Plug 'cloudhead/neovim-fuzzy'              " Fuzzy search, require `brew install fzy ripgrep`
Plug 'dyng/ctrlsf.vim'                     " Find in files similar to ctrl-shift-f in ST3

"""" Language enhancement
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Improved language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Conquer Of Completion Node.js auto completion
Plug 'editorconfig/editorconfig-vim'                " Editor config
Plug 'godlygeek/tabular'                            " :Tabularize \,
Plug 'JoosepAlviste/nvim-ts-context-commentstring'  " Contextual commentstring
Plug 'windwp/nvim-ts-autotag'                       " Auto close tag with treesitter
Plug 'windwp/nvim-autopairs'                        " Auto close brackets and quotes
Plug 'preservim/vim-markdown'                       " Better markdown support
Plug 'ap/vim-css-color'                             " CSS Color Preview
" Plug 'pangloss/vim-javascript'                    " Better JS syntax highlight
" Plug 'MaxMEllon/vim-jsx-pretty'                   " JSX syntax highlight
" Plug 'preservim/tagbar'                           " Tagbar for code navigation
Plug 'mustache/vim-mustache-handlebars'
Plug 'mattn/emmet-vim'                              " Emmet
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }  " :MarkdownPreview

set encoding=utf-8

call plug#end()

" :colorscheme onedark
" :colorscheme sonokai
:colorscheme OceanicNext
:set termguicolors

" Ctrl-Shift-F find in files
nmap     <C-S-f> <Plug>CtrlSFPrompt
vmap     <C-f>f <Plug>CtrlSFVwordPath
vmap     <C-f>F <Plug>CtrlSFVwordExec
nmap     <C-f>n <Plug>CtrlSFCwordPath
nmap     <C-f>p <Plug>CtrlSFPwordPath
nnoremap <C-f>o :CtrlSFOpen<CR>
nnoremap <C-f>t :CtrlSFToggle<CR>
inoremap <C-f>t <Esc>:CtrlSFToggle<CR>

nnoremap <C-p>   :FuzzyOpen<CR>
nnoremap <C-b>   :NvimTreeToggle<CR>
nnoremap <M-r>   :NvimTreeFindFile<CR>
nnoremap <C-l>   :call CocActionAsync('jumpDefinition')<CR>

" Ctrl-Option-Left or Right to move prev / next tab
noremap <silent> <C-Left> <Esc>:tabprevious<CR>
noremap <silent> <C-Right> <Esc>:tabnext<CR>

" save shortcut
noremap <M-s> <Esc>:w<CR>
inoremap <M-s> <Esc>:w<CR>
" close window
noremap <M-w> <Esc>:bd<CR>
inoremap <M-w> <Esc>:bd<CR>
" quit app, prompt enter to confirm
noremap <M-q> <Esc>:qa!
inoremap <M-q> <Esc>:qa!
" ctrl-c copy to clipboard
vnoremap <C-c> "+y<CR>
" scroll horizontal with Shift or Ctrl (real mouse wheel only work with Ctrl)
noremap <C-ScrollWheelUp> <ScrollWheelLeft>
noremap <S-ScrollWheelUp> <ScrollWheelLeft>
noremap <C-ScrollWheelDown> <ScrollWheelRight>
noremap <S-ScrollWheelDown> <ScrollWheelRight>
" turnoff  highlight
nnoremap <silent> <C-h> <Esc>:nohlsearch<CR>
" toggle word wrap
nnoremap <silent> <C-M-Z> <Esc>:set wrap!<CR>
" insert current ISO date time
inoremap <silent> <C-M-t> <C-r>=strftime('%FT%T%z')<CR>
nnoremap <silent> <C-M-t> "=strftime('%FT%T%z')<CR>P
" sort lines
vnoremap <silent> <F5> :'<, '>sort<CR>
nnoremap <silent> <C-F5> :%sort<CR>
" exit terminal with Esc
tnoremap <Esc> <C-\><C-n>
" bufferline pick
nnoremap <silent> gb :BufferLinePick<CR>
nnoremap <silent> b] :BufferLineCycleNext<CR>
nnoremap <silent> b[ :BufferLineCyclePrev<CR>

" custom vim-surround
" wrap text with **bold** format when surround with * character
autocmd FileType markdown let g:surround_42 = "**\r**"

" vim-move settings
let g:move_key_modifier = 'M'
let g:move_key_modifier_visualmode = 'M'

" Visual Multi settings
let g:VM_leader = '='
let g:VM_maps = {}
let g:VM_maps["Exit"]                   = '<C-c>'        " quit VM
let g:VM_maps['Find Under']             = '<C-d>'
let g:VM_maps['Find Subword Under']     = '<C-d>'
let g:VM_maps["Select Cursor Up"]       = '<M-C-Up>'     " start selecting up
let g:VM_maps["Select Cursor Down"]     = '<M-C-Down>'   " start selecting down
let g:VM_mouse_mappings = 1
let g:VM_maps["Mouse Cursor"]           = '<S-LeftMouse>'
let g:VM_maps["Mouse Word"]             = '<C-RightMouse>'
let g:VM_maps["Mouse Column"]           = '<S-RightMouse>'

" gitgutter
let g:gitgutter_sign_added = '│'      " look nicer and signal by color
let g:gitgutter_sign_modified = '│'   " look nicer and signal by color

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => COC configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_node_path = '/usr/local/bin/node'
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackSpace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ctrl-space to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Keys for gotos.
" Add any filetype with an lsp to this au.
nmap <silent> gd <Plug>(coc-declaration)
nmap <silent> gw <Plug>(coc-type-definition)
nmap <silent> gy <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Close a help floating window.
nmap <silent> <c-[> <esc>:noh<cr><Plug>(coc-float-hide)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" create :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Helper functions
function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" END COC Configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-javascript, enable jsdoc highlight
let g:javascript_plugin_jsdoc = 1

" vim markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_fenced_languages = ['jsx=javascript', 'js=javascript', 'bash=sh', 'shell=sh']

" highlight focused file in nvim-tree
autocmd BufEnter NvimTree* set cursorline

" setup lua plugins
lua << EOF
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- setup lualine
require('lualine').setup {
  highlights = {
    background = {
      italic = true,
    },
    buffer_selected = {
      bold = true,
    },
  },
  options = {
    mode = "buffers",
    icons_enabled = true,
    theme = 'auto',
    color_icons = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
    globalstatus = true,
    disabled_filetypes = {
      'NvimTree'
    },
    ignore_focus = {'NvimTree'},
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'buffers',
  --       mode = 2, -- Shows buffer name + buffer index
  --       filetype_names = {
  --         NvimTree = 'File Tree',
  --       }
  --     },
  --   },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {{'tabs', mode = 0}}, -- show only tab number
  -- },
  extensions = {'nvim-tree'}
}

-- setup bufferline
require("bufferline").setup {
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    diagnostics = "coc",
    indicator = {
      style = 'underline',
    },
    show_close_icon = true,
  },
}

-- setup NVimTree
require("nvim-tree").setup {
  hijack_cursor = true,   -- 
  open_on_tab = true,     -- open tree on new tab
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 200,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  renderer = {
    highlight_git = true,
  },
  filters = {
    dotfiles = false,
    custom = { 
      "\\.DS_Store",
      "\\.cache",
      "\\.git$",
      "\\.linaria-cache",
      "\\.sass-cache",
      "__coverage__",
      "node_modules",
      "package-lock\\.json",
      "pnpm-lock\\.yaml",
      "yarn\\.lock",
    },
  },
  view = {
    mappings = {
      list = {
        { key = "?", action = "toggle_help" },
        { key = "v", action = "vsplit" },
      }
    }
  },
}

-- improve indentline color
vim.cmd [[highlight IndentBlanklineChar guifg=#333f33]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#6699cc gui=nocombine]]

require'indent_blankline'.setup {
  show_current_context = true,
  -- show_current_context_start = true,
}

require'scrollbar'.setup {
  handle = {
    color = "#3f3f3f",
  },
  marks = {
    Search = { color = "#ff9e64"},
    Error = { color = "#db4b4b"},
    Warn = { color = "#e0af68"},
    Info = { color = "#0db9d7"},
    Hint = { color = "#1abc9c"},
    Misc = { color = "#9d7cd8"},
  }
}

require('nvim-autopairs').setup {}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  autotag = {
    enable = true,
  },
  -- Indentation based on treesitter for the = operator
  indent = {
    enable = true,
  },

  context_commentstring = {
    enable = true
  },

  ensure_installed = { "javascript", "html", "css", "scss", "bash", "dockerfile", "gitignore", "json", "typescript", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

