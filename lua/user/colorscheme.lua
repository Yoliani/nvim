vim.o.background = "dark" -- to load onedark
local colorscheme = "onedarkpro"
if colorscheme == 'onedarkpro' then require("onedarkpro").load() end
if colorscheme == 'onedark' then require("onedark").load() end


local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
