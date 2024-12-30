-- [[ Packer Setup ]]
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- [[ Packer can manage itself ]]
    use 'wbthomason/packer.nvim'

    -- [[ Telescope ]]
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- [[ Colorscheme ]]
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    -- [[ LSP and Autocompletion ]]
    use {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        }
    }

    -- [[ Treesitter ]]
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-treesitter/playground'
    use 'nvim-treesitter/nvim-treesitter-context'

    -- [[ Utilities ]]
    use {
        'ThePrimeagen/harpoon',
        branch = "harpoon2",
        requires = 'nvim-lua/plenary.nvim'
    }
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'folke/trouble.nvim'
    use 'windwp/nvim-autopairs'
    use 'github/copilot.vim'
    use 'eandrju/cellular-automaton.nvim'

    -- [[ Null-ls ]]
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
end)
