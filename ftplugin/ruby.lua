vim.cmd [[
function! RubocopAutoFix()
  exe "w"
  silent exe "!rubocop -a -R % &> /dev/null"
  silent exe "e %"
endfun
]]

vim.cmd [[setlocal iskeyword+=?]]
