local zoomHelper = {}

zoomHelper.statusPrint = function(event) hs.printf("Zoom Status: %s",event) end

-- statusPrinter takes a bool that enables printing all status changes from the zoom.us app
function zoomHelper:statusPrinter(enable)
	if enable then spoon.Zoom:setStatusCallback(self.statusPrint) end
end

if spoon.Zoom then return zoomHelper
else print("zoomHelper: the Zoom spoon doesn't appear to be loaded") end
