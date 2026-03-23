-- =============================================================================
-- Section 1: Leader key + editor options
-- =============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable unused providers (suppresses checkhealth warnings)
vim.g.loaded_node_provider    = 0
vim.g.loaded_perl_provider    = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0

-- Must be set before nvim-tree loads or netrw can still initialize
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.termguicolors   = true
opt.laststatus      = 2
opt.expandtab       = true
opt.softtabstop     = 4
opt.shiftwidth      = 4
opt.number          = true
opt.cursorline      = true
opt.showmatch       = true
opt.foldenable      = true
opt.backspace       = "indent,eol,start"
opt.listchars       = { eol = "↵", tab = ">·", trail = "~", extends = ">", precedes = "<", space = "·" }
opt.list            = true
opt.mouse           = "a"
opt.clipboard       = "unnamedplus"
opt.scrolloff       = 8
opt.signcolumn      = "yes"
opt.ignorecase      = true
opt.smartcase       = true

-- =============================================================================
-- Section 2: lazy.nvim bootstrap
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =============================================================================
-- Section 3: Plugin specs
-- =============================================================================
require("lazy").setup({

  -- File tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
        renderer = {
          icons = {
            show = {
              file         = false,
              folder       = false,
              folder_arrow = false,
              git          = false,
            },
          },
        },
        filters = { dotfiles = false, git_ignored = false },
      })
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local c = {
        bg   = "#1e1e2e",
        fg   = "#cdd6f4",
        gray = "#585b70",
        blue = "#89b4fa",
        green= "#a6e3a1",
        cyan = "#89dceb",
        red  = "#f38ba8",
        peach= "#fab387",
      }
      local theme = {
        normal   = { a = { bg = c.blue,  fg = c.bg, gui = "bold" }, b = { bg = c.gray, fg = c.fg }, c = { bg = c.bg, fg = c.fg } },
        insert   = { a = { bg = c.green, fg = c.bg, gui = "bold" }, b = { bg = c.gray, fg = c.fg }, c = { bg = c.bg, fg = c.fg } },
        visual   = { a = { bg = c.cyan,  fg = c.bg, gui = "bold" }, b = { bg = c.gray, fg = c.fg }, c = { bg = c.bg, fg = c.fg } },
        replace  = { a = { bg = c.red,   fg = c.bg, gui = "bold" }, b = { bg = c.gray, fg = c.fg }, c = { bg = c.bg, fg = c.fg } },
        command  = { a = { bg = c.peach, fg = c.bg, gui = "bold" }, b = { bg = c.gray, fg = c.fg }, c = { bg = c.bg, fg = c.fg } },
        inactive = { a = { bg = c.bg,    fg = c.gray             }, b = { bg = c.bg,   fg = c.gray }, c = { bg = c.bg, fg = c.gray } },
      }
      require("lualine").setup({
        options = {
          theme                = theme,
          section_separators   = { left = "|", right = "|" },
          component_separators = { left = "|", right = "|" },
          icons_enabled        = false,
        },
      })
    end,
  },

  -- Git gutter signs + inline blame
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "+" },
          change       = { text = "~" },
          delete       = { text = "_" },
          topdelete    = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = false,
      })
    end,
  },

  -- Git integration (kept as-is)
  { "tpope/vim-fugitive", lazy = false },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
        },
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSUninstall" },
  },

}, {
  -- lazy.nvim options
  rocks = { enabled = false },
  ui = { icons = { cmd = ">", config = "C", event = "E", ft = "F",
                   init = "I", keys = "K", plugin = "P", runtime = "R",
                   source = "S", start = "S", task = "T" } },
})

-- =============================================================================
-- Section 4: Keymaps + autocommands
-- =============================================================================

local map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- nvim-tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>")

-- Gitsigns
map("n", "]c", function()
  if vim.wo.diff then return "]c" end
  vim.schedule(function() require("gitsigns").next_hunk() end)
  return "<Ignore>"
end, { expr = true })
map("n", "[c", function()
  if vim.wo.diff then return "[c" end
  vim.schedule(function() require("gitsigns").prev_hunk() end)
  return "<Ignore>"
end, { expr = true })
map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")

-- Buffer navigation
map("n", "<S-h>", "<cmd>bprevious<CR>")
map("n", "<S-l>", "<cmd>bnext<CR>")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Auto-copy visual selection to clipboard on leaving visual mode
vim.api.nvim_create_autocmd("ModeChanged", {
  group    = augroup,
  pattern  = "[vV\22]*:n",
  callback = function() vim.cmd("silent! normal! gvy") end,
})

-- Auto-open nvim-tree on VimEnter (mirrors old NERDTree behaviour)
vim.api.nvim_create_autocmd("VimEnter", {
  group    = augroup,
  callback = function(data)
    local no_name  = data.file == "" and vim.bo[data.buf].buftype == ""
    local is_dir   = vim.fn.isdirectory(data.file) == 1

    -- If opening a directory, cd into it and open tree
    if is_dir then
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
      return
    end

    -- If opening a file (or blank nvim), open tree and focus the file/editor
    if not no_name then
      require("nvim-tree.api").tree.toggle({ focus = false })
      return
    end

    -- Plain `nvim` with no args
    require("nvim-tree.api").tree.open()
  end,
})

-- Auto-close nvim-tree when it is the last window
vim.api.nvim_create_autocmd("QuitPre", {
  group    = augroup,
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local non_float = vim.tbl_filter(function(w)
      return vim.api.nvim_win_get_config(w).relative == ""
    end, wins)
    -- If only nvim-tree + one other window remain, quit will leave just the tree
    if #non_float == 2 then
      local tree_ok, api = pcall(require, "nvim-tree.api")
      if tree_ok and api.tree.is_visible() then
        api.tree.close()
      end
    end
  end,
})
