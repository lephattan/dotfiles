return {
  auto_format = false,
  vim_options = {
    hlsearch = false,
  },
  telescope = {
    file_ignore_patterns = {
      "^should%-be%-ignored/",
      "^should_be_ignored/",
    }
  }
}
