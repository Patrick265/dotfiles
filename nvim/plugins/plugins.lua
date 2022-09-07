vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
	-- PACKER
	use 'wbthomason/packer.nvim'

	-- Airline
	use({
		"NTBBloodbath/galaxyline.nvim",
		-- some optional icons
		requires = { "kyazdani42/nvim-web-devicons", opt = true }	
	})

	use 'kyazdani42/nvim-web-devicons'
	use 'sainnhe/gruvbox-material'
end)

