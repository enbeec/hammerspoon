-- Hammerspoon hyperkey (and a test)
hyper = {"cmd", "alt", "ctrl"}
hs.hotkey.bind(hyper, "T", function()
		hs.alert.show("You pressed Hyper+T!")
end)

hs.hotkey.bind(hyper, "R", function()
		hs.alert.show("Config Reloaded!")
		hs.reload()
end)

-- Zoom 
-- spoon: https://github.com/jpf/Zoom.spoon
hs.loadSpoon("Zoom")

spoon.Zoom:start()

-- my ugly debug module :)
local zoomDebug = require "zoomDebug"

-- fn+h/j/k/l arrow key emulation
-- hs.loadSpoon("FnMate")
