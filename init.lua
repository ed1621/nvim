local pack_path = vim.fn.stdpath('data') .. '/site/pack'
local fmt = string.format

local function ensure_installed(user, repo)
	local install_path = fmt('%s/packer/start/%s', pack_path, repo)
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		print(fmt('Could not find %s, cloning new copy to %s', repo, install_path))
		vim.api.nvim_command(fmt('!git clone https://github.com/%s/%s %s', user, repo, install_path))
		vim.api.nvim_command(fmt('packadd %s', repo))
	end

	if repo == 'hotpot.nvim' then
		vim.cmd('helptags ' .. install_path .. '/doc')
	end
end

ensure_installed('wbthomason', 'packer.nvim')
ensure_installed('rktjmp', 'hotpot.nvim')

require('hotpot').setup({ provide_require_fennel = true })
require('reflect')
require('init')
