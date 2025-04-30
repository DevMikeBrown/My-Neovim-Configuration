require("CompKeys").setup()
require("SDL Compiler").Run()
require("plugins")
require("mason").setup()

require("bufferline").setup({
  options = {
    mode = "buffers",
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    show_close_icon = true,
    show_buffer_close_icons = true,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center"
      }
    },
    custom_filter = function(bufnr, buflist)
      local filetype = vim.bo[bufnr].filetype
      return filetype ~= "neo-tree"
    end,
    groups = {
      items = {
        require("bufferline.groups").builtin.pinned:with({ icon = "📌" }), -- show pinned buffers
      },
    },
  }
})
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer manages itself
  -- Add other plugins here
end)
require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      width = 0.9,
      preview_cutoff = 120,
    },
  }
}
require("neo-tree").setup({
  
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  sources = {
    "filesystem",
    "buffers",
    "git_status",
  },
  source_selector = {
  winbar = true,         -- show tabs in the top bar
  statusline = false,    -- disable in statusline
  show_scrolled_off_parent_node = true,
  },

  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = true,
    },
  },
})


vim.o.number = true
vim.o.relativenumber = true
vim.o.termguicolors = true

-- Enable true color support
vim.o.termguicolors = true

-- Set Catppuccin colorscheme
vim.cmd.colorscheme("catppuccin")

vim.g.mapleader = ' '  -- Set space as the leader key (if not already set)

-- Filesystem (File tree)
vim.keymap.set('n', '<leader>e', ':Neotree toggle filesystem left<CR>', { noremap = true, silent = true })

-- Buffers (Open files)
vim.keymap.set('n', '<leader>b', ':Neotree toggle buffers left<CR>', { noremap = true, silent = true })

-- Git Status (Modified files)
vim.keymap.set('n', '<leader>g', ':Neotree toggle git_status left<CR>', { noremap = true, silent = true })

-- Split windows
vim.keymap.set('n', [[\]], ':split<CR>', { noremap = true, silent = true })     -- Horizontal split
vim.keymap.set('n', [[|]], ':vsplit<CR>', { noremap = true, silent = true })    -- Vertical split

-- Resize splits with Ctrl + Arrow Keys
vim.keymap.set('n', '<C-Up>',    ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>',  ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Move between splits with Ctrl + h/j/k/l
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- File finder
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Live Grep (search content inside files)
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Buffers
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Help tags
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { noremap = true, silent = true })


vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })

-- Cycle buffers like LazyVim
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

-- Create a new empty buffer (like LazyVim <leader>b)
vim.keymap.set('n', '<leader>b', ':enew<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

-- Pin/unpin current buffer
vim.keymap.set('n', '<leader>bp', ':BufferLineTogglePin<CR>', { noremap = true, silent = true })

vim.opt.tabstop = 4        -- Number of visual spaces per TAB
vim.opt.shiftwidth = 4     -- Number of spaces for each indent level
vim.opt.expandtab = true   -- Use spaces instead of tabs

