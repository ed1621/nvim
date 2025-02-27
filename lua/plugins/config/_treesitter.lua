local M = {}

M.config = function()
  local ts_config = require('nvim-treesitter.configs')

  ts_config.setup {
   ensure_installed = {
     'bash',
     'dockerfile',
     'jq',
     'json',
     'lua',
     'python',
     'regex',
     'sql',
     'terraform',
     'toml',
     'yaml'
   },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    indent = {
      enable = true
    }
  }
end

-- M.parsers = function()
--   local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
--
--   -- parser_config.yaml = {
--   --   used_by = {'yml', 'yaml'}
--   -- }
--   parser_config.bash = {
--     used_by = {'bats', 'sh'}
--   }
-- end

return M
