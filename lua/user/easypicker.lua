local easypick = require("easypick")

easypick.setup({
	pickers = {
		{
			name = "ls",
			command = "ls",
			previewer = easypick.previewers.default()
		},
		{
			name = "conflicts",
			command = "git diff --name-only --diff-filter=U --relative",
			previewer = easypick.previewers.file_diff()
		},
	}
})
