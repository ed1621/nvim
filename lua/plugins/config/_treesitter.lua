local M = {}

M.config = function()
  local ts_config = require('nvim-treesitter.configs')

  ts_config.setup {
--    ensure_installed = {
--      'bash',
--      'dockerfile',
--      'hocon',
--      'jq',
--      'json',
--      'lua',
--      'python',
--      'regex',
--      'rust',
--      'scala',
--      'sql',
--      'toml',
--      'yaml'
--    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    indent = {
      enable = true
    }
  }
end

M.parsers = function()
  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

  parser_config.yaml = {
    used_by = {'yml', 'yaml'}
  }
  parser_config.scala = {
    used_by = {'scala', 'sc', 'sbt'}
  }
  parser_config.bash = {
    used_by = {'bats', 'sh'}
  }
end

return M
