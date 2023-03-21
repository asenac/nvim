local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'mrjones2014/nvim-ts-rainbow'

	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use 'gbrlsnchs/telescope-lsp-handlers.nvim'

	--use({ "kelly-lin/telescope-ag", requires = { { "nvim-telescope/telescope.nvim" } } })
	--use 'nvim-telescope/telescope-live-grep-args.nvim'

	use { 'nvim-telescope/telescope-project.nvim' }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' }, -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' }, -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	use {
		"ray-x/lsp_signature.nvim",
	}

	use {
		'echasnovski/mini.nvim',
		branch = 'stable',
		config = function()
			--require("mini.starter").setup()
			require("mini.misc").setup()
			MiniMisc.setup_auto_root()
			-- require("mini.statusline").setup()
			require("mini.tabline").setup()
			--require("mini.trailspace").setup()
		end
	}

	use {
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup {
				options = {
					icons_enabled = true,
					theme = 'gruvbox',
				}
			}
		end
	}

	use {
		'lewis6991/gitsigns.nvim',
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	}

	use { "ellisonleao/gruvbox.nvim" }
	use 'tomasiser/vim-code-dark'

	use 'voldikss/vim-floaterm'

	use "scrooloose/nerdcommenter"

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {}
		end
	}

	use {
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		config = function()
			require('dashboard').setup {
				-- config
			}
		end,
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	use {
		'johnfrankmorgan/whitespace.nvim',
		config = function()
			require('whitespace-nvim').setup({
				-- configuration options and their defaults

				-- `highlight` configures which highlight is used to display
				-- trailing whitespace
				highlight = 'DiffDelete',
				-- `ignored_filetypes` configures which filetypes to ignore when
				-- displaying trailing whitespace
				ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard', 'floaterm' },
			})

			-- remove trailing whitespace with a keybinding
			vim.keymap.set('n', '<Leader>wt', require('whitespace-nvim').trim)
		end
	}

	use { 'nkakouros-original/numbers.nvim',
		config = function()
			require('numbers').setup()
		end
	}

	use { 'Civitasv/cmake-tools.nvim',
		config = function()
			require("cmake-tools").setup {
				cmake_command = "cmake",
				cmake_build_directory = "build-release",
				cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
			}
		end
	}

	use {
		'nvim-telescope/telescope-ui-select.nvim'
	}

	use {
		'nvim-tree/nvim-tree.lua',
		config = function()
			require("nvim-tree").setup()
		end
	}

	use "rafamadriz/neon"

	-- Using packer.nvim
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
