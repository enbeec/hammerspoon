local zoomHelper = {}

--[[
TODO: I'm going to implement the mute function... somehow. 
Until then, I'll probably keep that in a branch that's not main. 
I want to get this to Steve very soon.
--]]

-- printer takes two parameters:
-- 		bool enable
-- 		an array of any of the following strings you don't want printing
-- 			
function zoomHelper.printer(enable, mute)
	local callbackFunc = nil or spoon.Zoom.callbackFunction

	-- is this.......
	zoomHelper.mute = mute or {}
	if mute then
		local muteFunc = function(event)
							-- and this ugly?? The callback and this module's table are both in the same memory map...
			for _,m in pairs(zoomHelper.mute) do 
							-- the Lua VM is really good at this sort of thing from what I've read
				-- anyway!	
				if event == m then else
					hs.printf("Zoom: %s", event)
				end
			end
		end
	end

	if enable then
		spoon.Zoom:setStatusCallback(muteFunc or print(event))
	else
		spoon.Zoom:setStatusCallback(callbackFunc)
	end
end

return zoomHelper
