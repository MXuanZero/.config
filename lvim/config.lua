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
  }
}

vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

lvim.leader = "space"

-- normal
lvim.keys.normal_mode["x"] = "\"_x"
lvim.keys.normal_mode["X"] = "\"_X"
lvim.keys.normal_mode["dd"] = "\"_dd"
lvim.keys.normal_mode["D"] = "\"_D"
lvim.keys.normal_mode["y"] = "\"+y"
lvim.keys.normal_mode["yy"] = "\"+yy"
lvim.keys.normal_mode["p"] = "\"+p"
lvim.keys.normal_mode["P"] = "\"+P"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-c>"] = "\"+yy"
lvim.keys.normal_mode["<C-x>"] = "\"+cc<ESC>\"_dd"
lvim.keys.normal_mode["<C-z>"] = "u"
lvim.keys.normal_mode["<C-/>"] = "gcc"
lvim.keys.normal_mode["<C-M-l>"] = "<cmd>lua require('lvim.lsp.utils').format()<cr>"
lvim.keys.normal_mode["<S-h>"] = "^"
lvim.keys.normal_mode["<S-l>"] = "g_"

-- insert
lvim.keys.insert_mode["jj"] = "<ESC>"
lvim.keys.insert_mode["<C-z>"] = "<ESC>ui"
lvim.keys.insert_mode["<C-/>"] = "<ESC>gcc"

-- visual
lvim.keys.visual_mode["x"] = "\"_x"
lvim.keys.visual_mode["X"] = "\"_X"
lvim.keys.visual_mode["dd"] = "\"_dd"
lvim.keys.visual_mode["D"] = "\"_D"
lvim.keys.visual_mode["p"] = "\"_d\"+P"
lvim.keys.visual_mode["P"] = "\"_d\"+P"
lvim.keys.visual_mode["<C-x>"] = "\"+c<ESC>"
lvim.keys.visual_mode["<C-c>"] = "\"+y"
lvim.keys.visual_mode["<C-z>"] = "u"
lvim.keys.visual_mode["<C-/>"] = "gc"

-- builtin
lvim.builtin.telescope.theme = "center"

lvim.builtin.terminal.execs = {
  { nil, "<M-`>", "Float Terminal", "float", nil },
  { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
  { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
}

lvim.builtin.treesitter.ensure_installed = {
  "bash", "fish",
  "asm", "c", "cpp", "make", "cmake",
  "java", "rust",
  "lua", "python",
  "javascript", "typescript", "css", "tsx", "html", "http",
  "json", "yaml", "xml",
  "markdown", "latex",
  "gitcommit",
}

-- bookmarks
require('bookmarks').setup {
  -- sign_priority = 8,  --set bookmark sign priority to cover other sign
  save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
  keywords =  {
    ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
    ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
    ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
    ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
  },
  on_attach = function(bufnr)
    local bm = require "bookmarks"
    local map = vim.keymap.set
    map("n","mm",bm.bookmark_toggle) -- add or remove bookmark at current line
    map("n","mi",bm.bookmark_ann) -- add or edit mark annotation at current line
    map("n","mc",bm.bookmark_clean) -- clean all marks in local buffer
    map("n","mn",bm.bookmark_next) -- jump to next mark in local buffer
    map("n","mp",bm.bookmark_prev) -- jump to previous mark in local buffer
    map("n","ml",bm.bookmark_list) -- show marked file list in quickfix window
    map("n","mx",bm.bookmark_clear_all) -- removes all bookmarks
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
