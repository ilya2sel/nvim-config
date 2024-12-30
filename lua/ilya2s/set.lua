-- [[ Basic Settings ]]
vim.opt.nu = true                        -- Line numbers
vim.opt.relativenumber = true            -- Relative line numbers

-- [[ Indentation ]]
vim.opt.tabstop = 4                      -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4                  -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.shiftwidth = 4                   -- Size of an indent
vim.opt.expandtab = true                 -- Use spaces instead of tabs
vim.opt.smartindent = true               -- Smart indentation

-- [[ Line Wrapping ]]
vim.opt.wrap = false                     -- Disable line wrap

-- [[ Backup and Undo ]]
vim.opt.swapfile = false                 -- Disable swapfile
vim.opt.backup = false                   -- Disable backup
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Set undo directory
vim.opt.undofile = true                  -- Enable persistent undo

-- [[ Search ]]
vim.opt.hlsearch = false                 -- Disable highlight on search
vim.opt.incsearch = true                 -- Enable incremental search

-- [[ Appearance ]]
vim.opt.termguicolors = true             -- True color support
vim.opt.scrolloff = 8                    -- Minimum number of screen lines to keep above and below the cursor
vim.opt.signcolumn = "yes"               -- Always show the sign column
vim.opt.isfname:append("@-@")            -- Treat '@' as part of a file name
vim.opt.colorcolumn = "80"               -- Highlight column at 80 characters

-- [[ Performance ]]
vim.opt.updatetime = 50                  -- Faster completion
