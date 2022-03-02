local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = {
            "javascript",
            "bash",
            "lua",
            "json",
            "python",
            "yaml",
            "c",
            "cpp",
            "dockerfile",
            "scala",
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

M.parsers = function()
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.yaml = {
        used_by = {'yml', 'yaml'}
    }
    parser_config.scala = {
        used_by = {'scala', 'sc', 'sbt'}
    }
    parser_config.elixir = {
        used_by = {'ex', 'exs'}
    }
    parser_config.bash = {
        used_by = {'sh', 'bats'}
    }
end

return M
