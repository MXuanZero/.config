-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  { "tomasky/bookmarks.nvim" },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  {
    "MXuanZero/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMTranslateTextHandler" },
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
      { "<leader>ae", mode = "v", "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>" },
      { "<leader>at", mode = "x", "<cmd>LLMTranslateTextHandler 你好，请英译汉<cr>" },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    -- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
  }
}

vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

lvim.leader = "space"

-- normal
lvim.keys.normal_mode["x"] = "\"_x"
lvim.keys.normal_mode["X"] = "\"_X"
lvim.keys.normal_mode["dd"] = "\"_dd"
lvim.keys.normal_mode["D"] = "\"_D"
lvim.keys.normal_mode["y"] = "\"+y"
lvim.keys.normal_mode["yy"] = "\"+yy"
lvim.keys.normal_mode["c"] = "\"+c"
lvim.keys.normal_mode["C"] = "\"+C"
lvim.keys.normal_mode["p"] = "\"+p"
lvim.keys.normal_mode["P"] = "\"+P"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-c>"] = "\"+yy"
lvim.keys.normal_mode["<C-x>"] = "\"+cc<ESC>\"_dd"
lvim.keys.normal_mode["<C-z>"] = "u"
lvim.keys.normal_mode["<C-/>"] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.normal_mode["<C-M-l>"] = "<cmd>lua require('lvim.lsp.utils').format()<cr>"
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["<S-l>"] = "g_"
lvim.keys.normal_mode["gr"] = "<cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = { \"%_test.go\" } })<cr>"
lvim.keys.normal_mode["gR"] = "<cmd>lua vim.lsp.buf.references()<cr>"

-- insert
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.insert_mode["<C-z>"] = "<ESC>ui"
lvim.keys.insert_mode["<C-/>"] = "<ESC>gcc"

-- visual
lvim.keys.visual_mode["x"] = "\"_x"
lvim.keys.visual_mode["X"] = "\"_X"
lvim.keys.visual_mode["dd"] = "\"_d"
lvim.keys.visual_mode["D"] = "\"_D"
lvim.keys.visual_mode["c"] = "\"+c"
lvim.keys.visual_mode["C"] = "\"+C"
lvim.keys.visual_mode["p"] = "\"_d\"+P"
lvim.keys.visual_mode["P"] = "\"_d\"+P"
lvim.keys.visual_mode["<C-x>"] = "\"+c<ESC>"
lvim.keys.visual_mode["<C-v>"] = "\"_d\"+P"
lvim.keys.visual_mode["<C-c>"] = "\"+y"
lvim.keys.visual_mode["<C-z>"] = "u"
lvim.keys.visual_mode["<C-/>"] = "gc"
lvim.keys.visual_mode["<S-h>"] = "^"
lvim.keys.visual_mode["<S-l>"] = "g_"

-- builtin
lvim.builtin.telescope.theme = "center"

lvim.builtin.which_key.vmappings = {
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
  a = {
    name = "ai",
    e = { "<cmd>LLMSelectedTextHandler 请解释下面这段代码<cr>", "解释代码" },
    t = { "<cmd>LLMTranslateTextHandler 你好，请英译汉<cr>", "英译汉" },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  },
  g = {
    name = "Git",
    r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
    s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
  },
}

lvim.builtin.which_key.mappings = {
  [";"] = { "<cmd>Alpha<CR>", "Dashboard" },
  ["w"] = { "<cmd>w!<CR>", "保存" },
  ["q"] = { "<cmd>confirm q<CR>", "退出" },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "行注释" },
  ["c"] = { "<cmd>BufferKill<CR>", "关闭缓存" },
  ["f"] = {
    function()
      require("lvim.core.telescope.custom-finders").find_project_files { previewer = false }
    end,
    "查找文件",
  },
  ["h"] = { "<cmd>nohlsearch<CR>", "取消高亮" },
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "资源管理器" },
  ["o"] = { "<cmd>AerialToggle<CR>", "大纲" },
  a = {
    name = "AI",
    t = { "<cmd>LLMSessionToggle<cr>", "对话" },
  },
  b = {
    name = "Buffers",
    j = { "<cmd>BufferLinePick<cr>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
    b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
    n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
    W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
    -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
  },
  p = {
    name = "Plugins",
    i = { "<cmd>Lazy install<cr>", "Install" },
    s = { "<cmd>Lazy sync<cr>", "Sync" },
    S = { "<cmd>Lazy clear<cr>", "Status" },
    c = { "<cmd>Lazy clean<cr>", "Clean" },
    u = { "<cmd>Lazy update<cr>", "Update" },
    p = { "<cmd>Lazy profile<cr>", "Profile" },
    l = { "<cmd>Lazy log<cr>", "Log" },
    d = { "<cmd>Lazy debug<cr>", "Debug" },
  },

  -- " Available Debug Adapters:
  -- "   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
  -- " Adapter configuration and installation instructions:
  -- "   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
  -- " Debug Adapter protocol:
  -- "   https://microsoft.github.io/debug-adapter-protocol/
  -- " Debugging
  g = {
    name = "Git",
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.nav_hunk('next', {navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.nav_hunk('prev', {navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    L = { "<cmd>lua require 'gitsigns'.blame_line({full=true})<cr>", "Blame Line (full)" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<cr>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  L = {
    name = "+LunarVim",
    c = {
      "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
      "Edit config.lua",
    },
    d = { "<cmd>LvimDocs<cr>", "View LunarVim's docs" },
    f = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
      "Find LunarVim files",
    },
    g = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
      "Grep LunarVim files",
    },
    k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
    i = {
      "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
      "Toggle LunarVim Info",
    },
    I = {
      "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
      "View LunarVim's changelog",
    },
    l = {
      name = "+logs",
      d = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(require('lvim.core.log').get_path())<cr>",
        "view default log",
      },
      D = {
        "<cmd>lua vim.fn.execute('edit ' .. require('lvim.core.log').get_path())<cr>",
        "Open the default logfile",
      },
      l = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(vim.lsp.get_log_path())<cr>",
        "view lsp log",
      },
      L = { "<cmd>lua vim.fn.execute('edit ' .. vim.lsp.get_log_path())<cr>", "Open the LSP logfile" },
      n = {
        "<cmd>lua require('lvim.core.terminal').toggle_log_view(os.getenv('NVIM_LOG_FILE'))<cr>",
        "view neovim log",
      },
      N = { "<cmd>edit $NVIM_LOG_FILE<cr>", "Open the Neovim logfile" },
    },
    r = { "<cmd>LvimReload<cr>", "Reload LunarVim's configuration" },
    u = { "<cmd>LvimUpdate<cr>", "Update LunarVim" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  T = {
    name = "Treesitter",
    i = { ":TSConfigInfo<cr>", "Info" },
  },
}

lvim.builtin.terminal.execs = {
  { nil, "<M-`>", "Float Terminal",      "float",      nil },
  { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
  { nil, "<M-2>", "Vertical Terminal",   "vertical",   0.4 },
}

lvim.builtin.treesitter.ensure_installed = {
  "bash", "fish",
  "asm", "c", "cpp", "make", "cmake", "kconfig", "linkerscript", "devicetree",
  -- "java", "rust",
  "lua", "python",
  -- "javascript", "typescript", "css", "tsx", "html", "http",
  "json", "yaml", "xml",
  "markdown", "markdown_inline",
  "gitcommit",
}

-- bookmarks
require('bookmarks').setup {
  -- sign_priority = 8,  --set bookmark sign priority to cover other sign
  save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
  keywords = {
    ["@t"] = "", -- mark annotation startswith @t ,signs this icon as `Todo`
    ["@w"] = "", -- mark annotation startswith @w ,signs this icon as `Warn`
    ["@f"] = "", -- mark annotation startswith @f ,signs this icon as `Fix`
    ["@n"] = "󰎚", -- mark annotation startswith @n ,signs this icon as `Note`
  },
  on_attach = function(bufnr)
    local bm = require "bookmarks"
    local map = vim.keymap.set
    map("n", "mm", bm.bookmark_toggle)    -- add or remove bookmark at current line
    map("n", "mi", bm.bookmark_ann)       -- add or edit mark annotation at current line
    map("n", "mc", bm.bookmark_clean)     -- clean all marks in local buffer
    map("n", "mn", bm.bookmark_next)      -- jump to next mark in local buffer
    map("n", "mp", bm.bookmark_prev)      -- jump to previous mark in local buffer
    map("n", "ml", bm.bookmark_list)      -- show marked file list in quickfix window
    map("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
  end
}

-- aerial
vim.keymap.set("n", "<space>o", "<cmd>AerialToggle<CR>")
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})

-- llm
require("llm").setup({
  max_tokens = 1024,
  url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
  model = "glm-4-flash",
  prefix = {
    user = { text = "\n", hl = "Title" },
    assistant = { text = "󰭹\n", hl = "Added" },
  },

  save_session = true,
  max_history = 15,

  -- stylua: ignore
  keys = {
    -- The keyboard mapping for the input window.
    ["Input:Submit"]      = { mode = "n", key = "<cr>" },
    ["Input:Cancel"]      = { mode = "n", key = "<C-c>" },
    ["Input:Resend"]      = { mode = "n", key = "<C-r>" },

    -- only works when "save_session = true"
    ["Input:HistoryNext"] = { mode = "n", key = "<C-j>" },
    ["Input:HistoryPrev"] = { mode = "n", key = "<C-k>" },

    -- The keyboard mapping for the output window in "split" style.
    ["Output:Ask"]        = { mode = "n", key = "i" },
    ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
    ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

    -- The keyboard mapping for the output and input windows in "float" style.
    ["Session:Toggle"]    = { mode = "n", key = "<leader>at" },
    ["Session:Close"]     = { mode = "n", key = "<esc>" },
  },
})

require('render-markdown').setup({
  enabled = true,
  heading = {
    -- Determines how icons fill the available space:
    --  inline:  underlying '#'s are concealed resulting in a left aligned icon
    --  overlay: result is left padded with spaces to hide any additional '#'
    position = 'inline',
    -- Width of the heading background:
    --  block: width of the heading text
    --  full:  full width of the window
    -- Can also be a list of the above values in which case the 'level' is used
    -- to index into the list using a clamp
    width = 'block',
    -- The 'level' is used to index into the list using a clamp
    -- Highlight for the heading icon and extends through the entire line
    backgrounds = {
      'RenderMarkdownH2Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH2Bg',
    },
    icons = { '󰉫 ', '󰉬 ', '󰉭 ', '󰉮 ', '󰉯 ', '󰉰 ' },
  },
  bullet = {
    icons = { '•', '◦', '▸', '▹' },
  },
  padding = {
    -- Highlight to use when adding whitespace, should match background
    highlight = 'Normal',
  },
  code = {
    style = 'normal',
    border = 'thick',
  },
})
