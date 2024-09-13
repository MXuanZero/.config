-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

vim.opt.tabstop = 2 -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

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

lvim.builtin.telescope.theme = "center"
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",  "cpp", "cmake",
	"java", "rust",
	"lua", "python",
	"javascript", "typescript", "css", "tsx",
	"json", "yaml",
	"markdown",
}

lvim.builtin.terminal = {
	execs = {
		{ nil, "<M-`>", "Float Terminal", "float", nil },
		{ nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
		{ nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
  },
}
