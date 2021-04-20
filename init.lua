-- Hammerspoon hyperkey (and a test)
--
hyper = {"cmd", "alt", "ctrl"}
hs.hotkey.bind(hyper, "T", function()
		hs.alert.show("You pressed Hyper+T!")
end)

hs.hotkey.bind(hyper, "R", function()
		hs.alert.show("Config Reloaded!")
		hs.reload()
end)

clear = hs.console.clearConsole
help = function() 
	print([[
== HELP =============================================================
the usual help() is still available: hs.help()
	=== CONSOLE PRIMER ===========================================
the best way to learn Hammerspoon is to run functions right in the
	console. You get nice feedback and it's a great way to poke
	around for new tricks in the documentation. Confusingly, some
	of the best stuff (like Spotify integration) isn't in a "spoon"
	just part of the 'hs' table. Some of the stuff in there is
	so handy that I've got aliases to make calling functions easier,
	etc. Check them out:
		clear() => hs.console.clearConsole()

	=== ZOOM =====================================================
all Zoom functions are stored in 'spoon.Zoom'; I have stored in 'z'
	so you can do things like -> z:mute() right in the console

If you want to see the API for this spoon, you'll have to read the
	source code (don't worry, all the functions you care about
I recommend lines 142 through the end of 'Zoom.spoon/init.lua':
	https://github.com/jpf/Zoom.spoon/blob/c3809490b3af390d920712eabba58202553e203e/init.lua#L142-L192
	]])
end

printConfig = function()
	local file = io.open("./init.lua", "r")
	print(file:read("*a"))
	file:close()
end

-- Zoom 
-- spoon: https://github.com/jpf/Zoom.spoon
hs.loadSpoon("Zoom")

spoon.Zoom:start()
z = spoon.Zoom

print([[.

 _    _    _    _    _    _    _    _    _    _    _    _    _   
 \"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-.

You Have Loaded Val's Hammerspoon Config...
		if you want to see what that entails, try printConfig()

_    _    _    _    _    _    _    _    _    _    _    _    _   
\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-._\"-.
"    "    "    "    "    "    "    "    "    "    "    "    "  
]])
