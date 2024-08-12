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
      map('n', '<A-.>', ':bn<CR>')
      map('n', '<A-,>', ':bp<CR>')
      map('n', '<A-c>', ':bd!<CR>')
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
  map('n', '<leader>t', ':lua require("nvim-tree.api").tree.toggle()<CR>')
end

M.telescope = function()
    map('n', '<leader>fo', ':lua require("telescope.builtin").oldfiles{only_cwd = true}<CR><ESC>')
    map('n', '<leader>f', ':lua require("telescope.builtin").find_files()<CR>')
    map('n', '<leader>g', ':lua require("telescope.builtin").git_files()<CR>')
    map('n', '<leader>mp', ':lua require("telescope.builtin").man_pages()<CR><ESC>')
    map('n', '<leader>r', ':lua require("telescope.builtin").registers()<CR><ESC>')
    map('n', '<leader><leader>f', ':lua require("telescope.builtin").live_grep()<CR>')
    map('n', '<leader><leader>b', ':lua require("telescope.builtin").buffers()<CR><ESC>')
    -- Telescope LSP
    map('n', '<leader>lr', ':lua require("telescope.builtin").lsp_references()<CR><ESC>')
    map('n', '<leader><leader>ld', ':lua require("telescope.builtin").lsp_definitions()<CR><ESC>')
    map('n', '<leader>ltd', ':lua require("telescope.builtin").lsp_type_definitions()<CR><ESC>')
    map('n', '<leader>li', ':lua require("telescope.builtin").lsp_implementations()<CR><ESC>')
    map('n', '<leader>lca', ':lua require("telescope.builtin").lsp_code_actions()<CR><ESC>')
    map('n', '<leader>lds', ':lua require("telescope.builtin").lsp_document_symbols()<CR><ESC>')
    map('n', '<leader>ld', ':lua require("telescope.builtin".lsp_diagnositcs{bufnr = 0}()<CR><ESC>')
    map('n', '<leader>td', ':lua require("telescope.builtin").diagnostics()<CR>')
    -- Telescope Git
    map('n', '<leader>gc', ':lua require("telescope.builtin").git_commits()<CR><ESC>')
    map('n', '<leader>gb', ':lua require("telescope.builtin").git_branches()<CR><ESC>')
    map('n', '<leader>gst', ':lua require("telescope.builtin").git_status()<CR><ESC>')
end

M.fterm = function()
  map('n', '<leader>s', ':lua require("FTerm").toggle()<CR>')
  map('t', '<leader>s', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
end

return M
