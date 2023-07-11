local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function add_desc(desc)
  return vim.tbl_extend("force", opts, { desc = desc})
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>ws", "<C-w>s", add_desc("Split window horizontally"))
keymap("n", "<leader>wv", "<C-w>v", add_desc("Split window vertically"))

keymap("n", "<leader>wc", "<C-w>c", add_desc("Close current window"))

keymap("n", "<leader>wh", "<C-w>h", add_desc("Move cursor, window left"))
keymap("n", "<leader>wj", "<C-w>j", add_desc("Move cursor, window below"))
keymap("n", "<leader>wk", "<C-w>k", add_desc("Move cursor, window above"))
keymap("n", "<leader>wl", "<C-w>l", add_desc("Move cursor, window right"))


-- Gitsigns

keymap("n", "<leader>gs", require("gitsigns").stage_hunk, add_desc("Stage hunk"))
keymap("n", "<leader>gu", require("gitsigns").stage_hunk, add_desc("Undo stage hunk"))
keymap("v", "<leader>gs", function() require("gitsigns").stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, add_desc("Stage hunk"))
keymap("v", "<leader>gu", function() require("gitsigns").stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, add_desc("Undo stage hunk"))
keymap("n", "<leader>gr", require("gitsigns").reset_hunk, add_desc("Reset hunk"))
keymap("n", "<leader>gS", require("gitsigns").stage_hunk, add_desc("Stage buffer"))
keymap("n", "<leader>gR", require("gitsigns").reset_buffer, add_desc("Reset buffer"))
keymap("n", "<leader>gp", require("gitsigns").preview_hunk, add_desc("Preview hunk"))
keymap("n", "<leader>gb", require("gitsigns").toggle_current_line_blame, add_desc("Toggle current line blame"))

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>bl", ":bnext<CR>", add_desc("Next buffer"))
keymap("n", "<leader>bh", ":bprevious<CR>", add_desc("Previous buffer"))

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope --
keymap("n", "<leader>ff", require'telescope.builtin'.find_files, add_desc("Find files"))
keymap("n", "<leader>fg", require'telescope.builtin'.live_grep, add_desc("Live grep"))
keymap("n", "<leader>fb", require'telescope.builtin'.buffers, add_desc("Find buffers"))
keymap("n", "<leader>fh", require'telescope.builtin'.help_tags, add_desc("Find in help tags"))

-- Nvimtree
keymap("n", "<leader>t", ":NvimTreeToggle<cr>", opts)

