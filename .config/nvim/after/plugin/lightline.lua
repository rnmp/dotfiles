vim.g.lightline = {
  colorscheme = 'nord',
  separator = { left = '', right= '' },
  inactive = {
    left = {{ "readonly", "relativepath", "modified" }},
    right = {{ "percent" }, { "lineinfo" }},
  },
  active = {
    left = {{ "mode", "paste" }, { "readonly", "relativepath", "modified" }},
    right = {{ "percent" }, { "lineinfo" }, { "filetype" }},
  },
  subseparator = { left = "", right = "" },
}
