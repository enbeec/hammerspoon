-- dark mode -------------------------------------------------------------------
hs.console.darkMode(true)
hs.console.consoleCommandColor(hs.drawing.color.white)

-- convenience functions -------------------------------------------------------
ez = require 'ez'

-- Hammerspoon hyperkey (and a test) -------------------------------------------
hyper = {"cmd", "alt", "ctrl"}
shyper = {"cmd", "alt", "ctrl", "shift"}
hs.hotkey.bind(hyper, "H", ez.help)
hs.hotkey.bind(hyper, "C", ez.clear)
hs.hotkey.bind(hyper, "R", hs.reload)

-- example of a holdFunc
hold = {} -- a namespace for holdFunc state
hs.hotkey.bind(hyper, "T", table.unpack( -- unpack the returned table
	ez.holdFunc( -- takes in two actions, does the rest
		function() hs.alert.show("Hyper + T") end, -- press
		function() hs.alert.show("Hyper + T: Judgement Day") end,-- hold
		hold.test, -- and here is the state variable
		-- and a done action!
		function() hs.alert.show ("Hyper + T: Rise of the Machines") end)))

-- example of a stateless holdFunc (holdFuncSL)

-- Zoom Setup (https://github.com/jpf/Zoom.spoon) ------------------------------
hs.loadSpoon("Zoom") 

spoon.Zoom:start() -- end Zooom config ----------------------------------------

-- zh --------------------------------------------------------------------------
zh = require "zh" -- script library zoomHelper
zh.statusPrinter(true)

