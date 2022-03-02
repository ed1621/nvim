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

    local function vim_config_file_mappings()
      map('n', '<leader>vimrc', ':vsplit $NVIM_HOME/init.lua<CR>')
      map('n', '<leader>plugins', ':vsplit $NVIM_HOME/lua/packerPlugins.lua<CR>')
      map('n', '<leader>mappings', ':vsplit $NVIM_HOME/lua/core/mappings.lua<CR>')
      map('n', '<leader>options', ':vsplit $NVIM_HOME/lua/core/options.lua<CR>')
      map('n', '<leader>commands', ':vsplit $NVIM_HOME/lua/vimscript/commands.vim<CR>')
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
      map('n', '<leader>jf', ':Josh<CR>')
      map('n', '<leader>mob', ':Mob<CR>')
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
    vim_config_file_mappings()
    lsp_mappings()
    git_mappings()
    packer_mappings()
end

M.markdown_preview = function()
    map('n', '<leader>md', ':MarkdownPreviewToggle<CR>')
end

M.dashboard = function()
    map("n", '<leader>bm', ":DashboardJumpMarks <CR>")
    map("n", '<leader>fn', ":DashboardNewFile <CR>")
    map("n", '<leader>db', ":Dashboard <CR>")
    map("n", '<leader><leader>sl', ":SessionLoad <CR>")
    map("n", '<leader><leader>ss', ":SessionSave <CR>")
end

M.neoformat = function()
    map('n', '<leader>fm', ':Neoformat<CR>') 
end

M.telescope_media = function()
    map('n', '<leader>fp', ':Telescope media_files<CR>')
end

M.split_term = function()
    map('n', '<A-j>', '<C-w>j')
    map('n', '<A-h>', '<C-w>h')
    map('n', '<A-k>', '<C-w>k')
    map('n', '<A-l>', '<C-w>l')
end

M.dap = function()
    map('n', '<leader>dc', ':lua require("dap").continue()<CR>')
    map('n', '<leader>dr', ':lua require"dap".repl.toggle()<CR>')
    map('n', '<leader>ds', ':lua require"dap.ui.variables".scopes()<CR>')
    map('n', '<leader>dK', ':lua require"dap.ui.widgets".hover()<CR>')
    map('n', '<leader>dt', ':lua require"dap".toggle_breakpoint()<CR>')
    map('n', '<leader>dso', ':lua require"dap".step_over()<CR>')
    map('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')
    map('n', '<leader>dl', ':lua require"dap".run_last()<CR>')
end

M.metals = function()
    map('n', '<leader>mb', ':MetalsImportBuild<CR>')
    map('n', '<leader>ws', ':lua require("metals").hover_worksheet()<CR>')
    map('n', '<leader>qw', ':lua require("metals").quick_worksheet()<CR>')
    map('n', '<leader>ns', ':lua require("metals").new_scala_file()<CR>')
    map('n', '<leader>oi', ':lua require("metals").organize_imports()<CR>')
    map('n', '<leader>sa', ':lua require("metals").start_ammonite()<CR>')
end

M.harpoon = function ()
    map('n', '<leader>hm', ':lua require("harpoon.mark").add_file()<CR>')
    map('n', '<leader>tm', ':Telescope harpoon marks<CR><ESC>')
    map('n', '<leader>rhm', ':RemoveHarpoonMark ')
    map('n', '<leader>rhma', ':lua require("harpoon.mark").clear_all()<CR>')
end

M.lspsaga = function()
    map('n', '<leader>gh', ':lua require("lspsaga.provider").lsp_finder()<CR>')
    map('n', '<leader>ca', ':lua require("lspsaga.codeaction").code_action()<CR>')
    map('v', '<leader>ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')
    map('n', 'K', ':lua require("lspsaga.hover").render_hover_doc()<CR>')
    map('n', '<C-f>', ':lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
    map('n', '<C-b>', ':lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')
    map('n', '<leader>gs', ':lua require("lspsaga.signaturehelp").signature_help()<CR>')
    map('n', '<leader>rn', ':lua require("lspsaga.rename").rename()<CR>')
    map('n', '<leader>pd', ':lua require("lspsaga.provider").preview_definition()<CR>')
    map('n', '<leader>cd', ':lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>')
    map('n', '[', ':lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
    map('n', ']', ':lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')
    map('n', '<leader>ft', ':lua require("lspsaga.floaterm").open_float_terminal()<CR>')
    map('t', '<leader>ft', '<C-\\><C-N>:lua require("lspsaga.floaterm").close_float_terminal()<CR>')
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

M.zk = function ()
  map('n', '<leader>zp', ':ZkNew { dir = "permanent" }<CR>')
  map('n', '<leader>zf', ':ZkNew { dir = "fleeting" }<CR>')
  map('n', '<leader>zb', ':ZkBacklinks<CR>')
  map('n', '<leader>zl', ':ZkLinks<CR>')
  map('n', '<leader>zt', ':ZkTags<CR>')
end

M.nnn = function ()
  map('n', '<leader>t', ':NnnPicker<CR>')
end

return M
