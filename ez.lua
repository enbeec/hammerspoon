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

-- TODO: the ez holdFunc SL is stateless [and can fire a third action after cooling down upon release]
function ez.holdFuncSL(action, holdAction, delay, doneAction)
	delay = delay or 0.2
	doneAction = doneAction or function() end
	-- wrap action function to create a timer with given delay and doneAction
	action = function() action() end
	-- wrap holdAction function with a function that:
	-- 		does nothing and resets the timer if it's running or
	-- 		does the holdAction and starts the timer
	doHold = function() end
	-- release function should reset the timer one more time
	release = function() end
	return { action, doHold, release }
end

return ez
