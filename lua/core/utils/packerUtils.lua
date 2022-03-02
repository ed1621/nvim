local M = {}

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
    if plugin then
        timer = timer or 0
        vim.defer_fn(function() 
            require("packer").loader(plugin) 
        end, timer)
    end
end

M.bootstrap_packer = function()
    vim.cmd[[packadd packer.nvim]]
    local present, packer = pcall(require, 'packer')

    if not present then
        local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'

        print 'Cloning Packer...'
        vim.fn.delete(packer_path, 'rf')
        vim.fn.system {
            'git',
            'clone',
            'https://github.com/wbthomason/packer.nvim',
            '--depth',
            '20',
            packer_path
        }
        
        vim.cmd[[packadd packer.nvim]]
        present, packer = pcall(require, 'packer')

        if present then
            print 'Packer cloned successfully!'
            return packer
        else
            error('Couldn\'t clone Packer !\nPacker path: ' .. packer_path .. '\n' .. packer)
        end
    else
        return packer
    end
end

return M
