-- Hi Kelly! Let me know if you have any questions upon cracking open your init.lua for the first time! -- Val

-- Zoom 
-- spoon: https://github.com/jpf/Zoom.spoon
hs.loadSpoon("Zoom")
-- this is where we would do our fancy configuration of the Zoom plugin itself
-- and then once we're setup we can start the Zoom plugin
-- remember, this file (init.lua) is the first thing to run when Hammerspoon starts
spoon.Zoom:start()

-- wrapper function for the mute toggle (passing object methods directly can be finnicky)
zToggle = function()
    spoon.Zoom:toggleMute()
end

-- and the key binding!
hs.hotkey.bind('opt', 'z', zToggle)

print([[.

 _    _    _    _    _    _    _    _    _    _    _    _    _   
 \"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-.

You Have Loaded Kelly's Hammerspoon Config... by Val <3

_    _    _    _    _    _    _    _    _    _    _    _    _   
\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-.
"    "    "    "    "    "    "    "    "    "    "    "    "  
]])
