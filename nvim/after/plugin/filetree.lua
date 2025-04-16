
require("nvim-tree").setup(
{
    sort_by = "name",
    view = {
        width = 30,
    },
    filters = {
        dotfiles = false,
        git_ignored = false
    }
})
