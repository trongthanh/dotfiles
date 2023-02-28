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

let mapleader = "," " map leader to comma

call plug#begin()

"""" UI enhancement
Plug 'nvim-tree/nvim-web-devicons'     " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'         " NvimTree plugin
Plug 'nvim-lualine/lualine.nvim'       " Status bar
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' } " Bufferline
Plug 'airblade/vim-gitgutter'          " Git gutter
Plug 'tpope/vim-fugitive'              " Git inside vim
Plug 'f-person/git-blame.nvim'         " Git blame status
Plug 'petertriho/nvim-scrollbar'       " Scroll bar with gutter highlight
" Plug 'tc50cal/vim-terminal'          " Vim Terminal
" Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'sainnhe/sonokai'                 " Sonokai colorscheme
Plug 'mhartington/oceanic-next'        " Oceanic Next scheme
Plug 'joshdick/onedark.vim'            " OneDark color scheme

"""" Motion and shortcuts
Plug 'tpope/vim-surround'                  " Surrounding cs'` ysw)
Plug 'matze/vim-move'                      " Move text <S-hjkl>
Plug 'lukas-reineke/indent-blankline.nvim' " Show indent guide
Plug 'numToStr/Comment.nvim'               " Commenting code with gcc & gbc
Plug 'mg979/vim-visual-multi'              " Multiple cursor
Plug 'nvim-lua/plenary.nvim'               " telescope prerequisite
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' } " Pick files or command (similar to cmd-P in ST3)
Plug 'dyng/ctrlsf.vim'                     " Find in files similar to ctrl-shift-f in ST3

"""" Language enhancement
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Improved language support
Plug 'nvim-treesitter/nvim-tree-docs'               " Doc comments powered by treesitter (gdd)
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Conquer Of Completion Node.js auto completion
Plug 'gpanders/editorconfig.nvim'                   " Better Editorconfig with custom properties
Plug 'godlygeek/tabular'                            " :Tabularize \,
Plug 'JoosepAlviste/nvim-ts-context-commentstring'  " Contextual commentstring
Plug 'windwp/nvim-ts-autotag'                       " Auto close tag with treesitter
Plug 'windwp/nvim-autopairs'                        " Auto close brackets and quotes
Plug 'preservim/vim-markdown'                       " Better markdown support
Plug 'norcalli/nvim-colorizer.lua'                  " Color code highlighter
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
"vmap     <C-f>f <Plug>CtrlSFVwordPath
"vmap     <C-f>F <Plug>CtrlSFVwordExec
"nmap     <C-f>n <Plug>CtrlSFCwordPath
"nmap     <C-f>p <Plug>CtrlSFPwordPath
nnoremap <leader>fo :CtrlSFOpen<CR>
nnoremap <leader>ft :CtrlSFToggle<CR>
inoremap <S-f>t <Esc>:CtrlSFToggle<CR>

nnoremap <C-b>   :NvimTreeToggle<CR>
nnoremap <C-S-b> :NvimTreeFocus<CR>
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

" the rest of COC config is in lua.init
let g:coc_node_path = '/usr/local/bin/node'

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

-- setup NVimTree
require("nvim-tree").setup {
  hijack_cursor = true,
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

-- auto close if last window (use @PROxZIMA)
-- local modifiedBufs = function(bufs)
--     local t = 0
--     for k,v in pairs(bufs) do
--         if v.name:match("NvimTree_") == nil then
--             t = t + 1
--         end
--     end
--     return t
-- end
--
-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if #vim.api.nvim_list_wins() == 1 and
--         vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
--         modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
--             vim.cmd "quit"
--         end
--     end
-- })

-- open on setup for directory or noname buffer
local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- setup lualine
vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
vim.g.gitblame_date_format = '%r'
vim.g.gitblame_message_template = '<author>, <date>'
local git_blame = require('gitblame')

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
  sections = {
    lualine_b = {
      'branch',
      'diff',
      { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
      'diagnostics',
    },
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

require'colorizer'.setup()

require('Comment').setup()

require'nvim-treesitter.configs'.setup {
  -- Treesitter doc
  tree_docs = {
    enable = true
  },
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

  ensure_installed = { "javascript", "css", "scss", "bash", "dockerfile", "gitignore", "json", "typescript", "tsx", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "html", "markdown" },

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

--
-- COC Config move to lua to avoid mapping conflict with other lua plugins
--
local keyset = vim.keymap.set
-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use <c-space> to trigger completion.
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation.
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window.
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Highlight the symbol and its references when holding the cursor.
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Symbol renaming.
keyset("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})

-- Formatting selected code.
keyset("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
keyset("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

-- Setup formatexpr specified filetype(s).
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder.
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
keyset("x", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)
keyset("n", "<leader>a", "<Plug>(coc-codeaction-selected)", opts)

-- Remap keys for applying codeAction to the current buffer.
keyset("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)


-- Apply AutoFix to problem on the current line.
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)


-- Run the Code Lens action on the current line.
keyset("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
keyset("x", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("o", "if", "<Plug>(coc-funcobj-i)", opts)
keyset("x", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("o", "af", "<Plug>(coc-funcobj-a)", opts)
keyset("x", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("o", "ic", "<Plug>(coc-classobj-i)", opts)
keyset("x", "ac", "<Plug>(coc-classobj-a)", opts)
keyset("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> for scroll float windows/popups.
---@diagnostic disable-next-line: redefined-local
-- local opts = {silent = true, nowait = true, expr = true}
-- keyset("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
-- keyset("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
-- keyset("i", "<C-f>",
--        'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
-- keyset("i", "<C-b>",
--        'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
-- keyset("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
-- keyset("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
-- keyset("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
-- keyset("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})


-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics.
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions.
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands.
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document.
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols.
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item.
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item.
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list.
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

-- Telescope
local actions = require('telescope.actions')
local dropdown_theme = require('telescope.themes').get_dropdown({
  results_height = 20;
  winblend = 20;
  width = 0.8;
  previewer = false;
})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
    --   theme = "dropdown",
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    current_buffer_fuzzy_find = {
      theme = "dropdown",
    },
    treesitter = {
      theme = "dropdown",
    },
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-S-p>', builtin.commands, {})
vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<C-j>', builtin.treesitter, {})

EOF

