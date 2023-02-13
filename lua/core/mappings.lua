local map = require('core.utils.init').general.map

local M = {}

M.global = function()
    local function general_mappings()
      map('i', 'kj', '<Esc>')
      -- don't copy replaced text after pasting
      map('v', 'p', '"_dP')
      -- copy to clipboard
      map('v', '<leader>y', '"*y<CR>')
      map('n', '<leader>y', 'V"*y<CR>')
      -- paste from clipboard
      map('v', '<leader>p', '"*p<CR>')
      map('n', '<leader>p', '"*p<CR>')
      -- use ESC to turn off search highlighting
      map('n', '<Esc>', ':noh <CR>')
    end

    local function save_mappings()
      map('n', '<leader>ww', ':w<CR>')
      map('n', '<leader>wa', ':wa<CR>')
      map('n', '<leader>wq', ':w<CR>:bd<CR>')
      map('n', '<leader>qq', ':q!<CR>')
      map('n', '<leader>qa', ':qa!<CR>')
    end

    local function buffer_movement_mappings()
      map('n', '<leader>bn', ':bn<CR>')
      map('n', '<leader>bp', ':bp<CR>')
      map('n', '<leader>bd', ':bd!<CR>')
    end

    local function lsp_mappings()
      -- buffer mappings
      map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
      map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
      map('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>')
      map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
      map('n', '<leader>d', ':lua vim.diagnostic.open_float()<CR>')
      map('n', '<leader><leader>n', ':lua vim.diagnostic.goto_next()<CR>')
      map('n', '<leader><leader>p', ':lua vim.diagnostic.goto_prev()<CR>')

    end

    local function git_mappings()
    end

    local function packer_mappings()
      map('n', '<leader>pi', ':PackerInstall<CR>')
      map('n', '<leader>pu', ':PackerUpdate<CR>')
      map('n', '<leader>pc', ':PackerCompile<CR>')
      map('n', '<leader>ps', ':PackerSync<CR>')
      map('n', '<leader>pcl', ':PackerClean<CR>')
    end
    
    
    general_mappings()
    save_mappings()
    buffer_movement_mappings()
    lsp_mappings()
    git_mappings()
    packer_mappings()
end

M.nvimtree = function()
  map('n', '<leader>t', ':NvimTreeToggle<CR>')
end

M.telescope = function()
    map('n', '<leader>fo', ':lua require("telescope.builtin").oldfiles{only_cwd = true}<CR><ESC>')
    map('n', '<leader>f', ':Telescope find_files<CR>')
    map('n', '<leader>g', ':Telescope git_files<CR>')
    map('n', '<leader>mp', ':Telescope man_pages<CR><ESC>')
    map('n', '<leader>r', ':Telescope registers<CR><ESC>')
    map('n', '<leader><leader>f', ':Telescope live_grep<CR>')
    map('n', '<leader><leader>b', ':Telescope buffers<CR><ESC>')
    -- Telescope LSP
    map('n', '<leader>lr', ':Telescope lsp_references<CR><ESC>')
    map('n', '<leader><leader>ld', ':Telescope lsp_definitions<CR><ESC>')
    map('n', '<leader>ltd', ':Telescope lsp_type_definitions<CR><ESC>')
    map('n', '<leader>li', ':Telescope lsp_implementations<CR><ESC>')
    map('n', '<leader>lca', ':Telescope lsp_code_actions<CR><ESC>')
    map('n', '<leader>lds', ':Telescope lsp_document_symbols<CR><ESC>')
    map('n', '<leader>ld', ':lua require("telescope.builtin".lsp_diagnositcs{bufnr = 0}<CR><ESC>')
    map('n', '<leader>td', ':Telescope diagnostics<CR>')
    -- Telescope Git
    map('n', '<leader>gc', ':Telescope git_commits<CR><ESC>')
    map('n', '<leader>gb', ':Telescope git_branches<CR><ESC>')
    map('n', '<leader>gst', ':Telescope git_status<CR><ESC>')
end

return M
