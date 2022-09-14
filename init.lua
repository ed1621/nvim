local pack_path = vim.fn.stdpath('data') .. '/site/pack'
local fmt = string.format

local function assert_installed_plugin(plugin, branch)
  local _, _, plugin_name = string.find(plugin, [[%S+/(%S+)]])
  local plugin_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/" .. plugin_name
  if vim.fn.empty(plugin_path) ~= 0 then
    fprint("Couldn't find '%s', cloning new copy to %s", plugin_name, plugin_path)
    if branch ~= nil then
      vim.fn.system({
        "git",
        "clone",
        "https://github.com/" .. plugin,
        "--branch",
        branch,
        plugin_path,
      })
    else
      vim.fn.system({
        "git",
        "clone",
        "https://github.com/" .. plugin,
        plugin_path,
      })
    end
  end
end

assert_installed_plugin("wbthomason/packer.nvim")
assert_installed_plugin("rktjmp/hotpot.mvin")

require('hotpot').setup({ provide_require_fennel = true })
require('reflect')
require('init')
