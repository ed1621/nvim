(let [neotree (require :neo-tree)]
	(neotree.setup {
    :window {:position "float"}
		:filesystem {
      :filtered_items {
        :visible false
				:hide_dotfiles false
				:hide_gitignored true}}})
)
