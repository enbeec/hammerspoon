local ez = {}

function ez.clear() hs.console.clearConsole() end
function ez.help()
	print( [[ Help: 
		showMe(table) -> prints the contents of a table (sometimes gets messy)
	]])
end

function ez.showMe(this)
	local contents = {}

	if (type(this) == "function") then 
		print("this is a function...")
		return
	end

	for k,v in pairs(this) do 
		contents[#contents+1] = "\t" .. k
		contents[#contents+1] = ": "
		if (type(v) == "function") then
			contents[#contents+1] = "a function"
		elseif (type(v) == "table") then
			contents[#contents+1] = "a table"
		else
			contents[#contents+1] = v 
		end
		contents[#contents+1] = "\n"
	end

	hs.printf("%s:\n%s", this, table.concat(contents))
end

-- the ez holdFunc lets you easily define a hotkey that has a second action if held
-- example of a holdFunc
	-- hold = { test = false } -- holdFuncs need a state variable to prevent repeats
	-- hs.hotkey.bind(hyper, "T", table.unpack( -- unpack the returned table
	-- 	ez.holdFunc( -- takes in two actions, does the rest
	-- 		function() hs.alert.show("Hyper + T") end, -- press
	-- 		function() hs.alert.show("Hyper + T: Judgement Day") end,-- hold
	--	hold.test, -- and here is the state variable
	--	function() hs.alert.show ("Hyper + T: Rise of the Machines") end)) -- done
function ez.holdFunc(action, holdAction, held, releaseAction)
	doAction = function() held = false; action() end
	doHold = function() if not held then holdAction(); held = true end end
	releaseAction = releaseAction or function() end
	doRelease = function() if held then held = false; releaseAction() end end
	return { doAction, doRelease, doHold }
end

--============= SPOTIFY ==================================
-- "aliases" so to speak
vol = hs.spotify.setVolume

-- some state
ez.spot = {
	currentVol = hs.spotify.getVolume(),
	isDim = false,
	dimDiv = 2
}

-- main functions
function ez.spot:Sync()
	self.currentVol = hs.spotify.getVolume()
end

function ez.spot:Dim(div)
	div = div or self.dimDiv
	local v = hs.spotify.getVolume()

	-- check if volume needs to be updated
	if v ~= self.currentVol then
		if isDim then
			if v >= self.oldVol then
				isDim = false
--			else
--				-- it was probably just too dim, lets adjust the div?
--				local divAdjust = 0.3
--				self.dimDiv = self.dimDiv - divAdjust
			end
		end	
		-- if !isDim, we need to sync and dim anyway
		self:Sync()
	end
	
	if isDim then
		self.currentVol = self.oldVol
		isDim = false
	else
		self.oldVol = self.currentVol
		self.currentVol = math.ceil(self.currentVol / div)
		isDim = true
	end
	
	-- all logic is handled, set and return the Spotify volume
	hs.spotify.setVolume(self.currentVol)
	return self.currentVol
end

-- end spotify

return ez
