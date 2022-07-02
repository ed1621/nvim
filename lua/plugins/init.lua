-- :fennel:1656727547
do
  if (0 == vim.fn.isdirectory("/Users/ed/.local/share/nvim/site/pack/packer/start/packer.nvim")) then
    print("packer.nvim: installing in data dir...")
    do end (_G)["packer_bootstrap"] = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", "/Users/ed/.local/share/nvim/site/pack/packer/start/packer.nvim"})
    vim.cmd("redraw")
    vim.cmd("packadd packer.nvim")
    print("packer.nvim: installed")
  else
  end
  do end (require("packer")).init({})
end
local function _2_(use)
  _G.assert((nil ~= use), "Missing argument use on plugins/init.fnl:6")
  use("wbthomason/packer.nvim")
  do
    use({"udayvir-singh/hibiscus.nvim"})
    local function _3_()
      return require("plugins.configurations.treesitter")
    end
    use({config = _3_, run = ":TSUpdate", "nvim-treesitter/nvim-treesitter"})
    use({requires = {"nvim-treesitter/nvim-treesitter"}, "glepnir/zephyr-nvim"})
    local function _4_()
      return require("plugins.configurations.neotree")
    end
    use({branch = "v2.x", config = _4_, requires = {"nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "MunifTanjim/nui.nvim"}, "nvim-neo-tree/neo-tree.nvim"})
  end
  if _G.packer_bootstrap then
    return (require("packer")).sync()
  else
    return nil
  end
end
return (require("packer")).startup(_2_)