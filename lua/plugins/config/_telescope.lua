local telescope = require('telescope')
telescope.setup {
  defaults = {
    path_display={"smart"},
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--hidden',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    file_ignore_patterns = {
      'target//*',
      'project//*',
      '.bsp//*',
      '.ammonite//*',
      '.git//*',
      '.idea//*',
      '.bloop//*',
      '.DS_Store',
      '.scalafmt.conf',
      '.metals//*',
      '.tfstate'
    }
  },
}

--telescope.load_extension('media_files')
--telescope.load_extension('harpoon')
