local colors = require('plugins.config.feline.colors')

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.blue,
    VISUAL = colors.violet,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.red,
    ['V-REPLACE'] = colors.red,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.magenta,
    SHELL = colors.green,
    TERM = colors.blue,
    NONE = colors.yellow
}

local vi_mode_text = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    [''] = "V-BLOCK",
    V = "V-LINE",
    c = "COMMAND",
    no = "UNKNOWN",
    s = "UNKNOWN",
    S = "UNKNOWN",
    ic = "UNKNOWN",
    R = "REPLACE",
    Rv = "UNKNOWN",
    cv = "UNKWON",
    ce = "UNKNOWN",
    r = "REPLACE",
    rm = "UNKNOWN",
    t = "INSERT"
}

local function file_osinfo()
    local os = vim.loop.os_uname().sysname:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    elseif os == 'DARWIN' then
        icon = ' '
        os = 'OSX'
    else
        icon = ' '
    end
    return icon .. os
end

local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'

-- LuaFormatter off

local comps = {
    vi_mode = {
        left = {
            provider = function()
                local current_text = ' '..vi_mode_text[vim.fn.mode()]..' '
                return current_text
            end,
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = colors.bg,
                    bg = vi_mode_utils.get_mode_color(),
                    style = 'bold'
                }
                return val
            end
            -- right_sep = ' '
        },
        right = {
            provider = '▊',
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color()
                }
                return val
            end,
            left_sep = ' '
        }
    },
    file = {
        info = {
            provider = require("plugins.config.feline.file_name").get_current_ufn,
            hl = {
                fg = colors.blue,
                style = 'bold'
            },
            left_sep = ' '
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        }
    },
    line_percentage = {
        provider = 'line_percentage',
        left_sep = ' ',
        hl = {
            style = 'bold'
        }
    },
    position = {
        provider = 'position',
        left_sep = ' ',
        right_sep = ' ',
        hl = function()
            local val = {
                name = vi_mode_utils.get_mode_highlight_name(),
                fg = colors.bg,
                bg = vi_mode_utils.get_mode_color(),
                style = 'bold'
            }
            return val
        end
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
    diagnos = {
        err = {
            provider = 'diagnostic_errors',
            enabled = function()
                return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
            end,
            hl = {
                fg = colors.red
            }
        },
        warn = {
            provider = 'diagnostic_warnings',
            enabled = function()
                return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
            end,
            hl = {
                fg = colors.yellow
            }
        },
        hint = {
            provider = 'diagnostic_hints',
            enabled = function()
                return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
            end,
            hl = {
                fg = colors.cyan
            }
        },
        info = {
            provider = 'diagnostic_info',
            enabled = function()
                return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
            end,
            hl = {
                fg = colors.blue
            }
        },
    },
    lsp = {
        name = {
            provider = 'lsp_client_names',
            left_sep = ' ',
            icon = ' ',
            hl = {
                fg = colors.yellow
            }
        }
    },
    git = {
        branch = {
            provider = 'git_branch',
            icon = ' ',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            },
        },
        add = {
            provider = 'git_diff_added',
            hl = {
                fg = colors.green
            }
        },
        change = {
            provider = 'git_diff_changed',
            hl = {
                fg = colors.orange
            }
        },
        remove = {
            provider = 'git_diff_removed',
            hl = {
                fg = colors.red
            }
        }
    }
}

local components = {
    active = {
        -- left
        {
            comps.vi_mode.left,
            comps.file.info,
            comps.lsp.name,
            comps.diagnos.err,
            comps.diagnos.warn,
            comps.diagnos.hint,
            comps.diagnos.info
        },
        --middle
        {},
        --right
        {
            comps.git.add,
            comps.git.change,
            comps.git.remove,
            comps.file.os,
            comps.git.branch,
            -- comps.vi_mode.right
            comps.position
        }
    },
    inactive = {
        -- left
        {
            comps.file.info,
        },
        --middle
        {},
        --right
        {
            comps.file.os,
        }
    }
}

-- LuaFormatter on

require'feline'.setup {
    bg = colors.bg,
    fg = colors.fg,
    components = components,
    vi_mode_colors = vi_mode_colors,
    force_inactive = {
        filetypes = {
            'NvimTree',
            'dbui',
            'packer',
            'startify',
            'fugitive',
            'fugitiveblame'
        },
        buftypes = {'terminal'},
        bufnames = {}
    }
}
