-- caffeine
hs.loadSpoon('Caffeine')

-- window management
--set right command to hyper in karabiner
local hyper = {"ctrl", "alt", "cmd", "shift"}

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"}
})
