vim.g.tokyonight_style = "moon"

local colorscheme = "tokyonight-moon"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end