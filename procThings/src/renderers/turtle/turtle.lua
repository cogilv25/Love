require "src/renderers/turtle/settings"

TurtleRenderer = Renderer:augment()


local com = love.thread.getChannel("com")
local stream = false
local transList = {}


function TurtleRenderer:draw()
	love.graphics.push()
	love.graphics.applyTransform(self.defaultCoordOffset)
	for k,v in pairs(transList)do
		love.graphics.draw(self.turtleSettings.mesh,v)
	end
	love.graphics.pop()
end

function TurtleRenderer:update()
	if(self.ready == false)then
		if(stream)then
			local t = com:pop()
			if(t == nil) then
				love.thread.getChannel( "waitToExit" ):supply(true,10)
				self.ready = true
			else
				transList[#transList+1] = t
				for i=1,5 do
					transList[#transList+1] = com:pop()
				end
			end
		elseif(com:pop() == true) then
			stream = true 
		end
	end
end

function TurtleRenderer:setInput(input)
	self.worker:start(input, self.turtleSettings.entity, self.turtleSettings.ruleSet, self.turtleSettings.threadImports, self.turtleSettings.threadSettings)

	if(com:demand(3) ~= true) then
    	print("Fatal error occured in thread\nStart of error log:\n")
    	local message = com:demand(1)
    	while message ~= nil do
    		print(message)
    		message = com:demand(1)
    	end
    	print("\nEnd of error log")
    else
    	print("Thread initialised successfully!\n")

    end
end

TurtleRenderer.worker = love.thread.newThread("src/renderers/turtle/turtlethread.lua")

TurtleRenderer.ready = false

-- I'm sorry <3
-- Sets the origin to the bottom, centre of the screen
TurtleRenderer.defaultCoordOffset = love.math.newTransform():translate((function () local w,h = love.graphics.getDimensions(); return w/2-5,h-10 end )())



function TurtleRenderer:construct()

	self.turtleSettings = self.turtleSettings or TurtleSettings:new()

end