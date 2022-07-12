local api = vim.api
local create_autocmd = api.nvim_create_autocmd

api.nvim_create_autocmd(
{'BufNewFile', 'BufRead'}, {
  pattern={'*.py'},
  command=[[set tabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix]]
})

create_autocmd({'FileType'}, {
  pattern={'vue'},
  command=[[setlocal sts=0 expandtab|set filetype=vue.html]],
})


create_autocmd({'FileType'}, {
  pattern={'php'},
  command=[[setlocal ai si]],
})

