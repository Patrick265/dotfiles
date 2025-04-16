local telescope = require("telescope")

telescope.setup({
    file_ignore_patterns = {
        "extern"
    }
})
