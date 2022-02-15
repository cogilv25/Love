-- Written by Calum Lindsay.

require "src/datamanager"
require "src/utility/debug"

local mesh = love.graphics.newMesh({{0,0,0,0},{0,10,0,1},{10,0,1,0},{10,10,1,1}},"strip")

local ballPos = {}
local ballVelY = 150
local ballVelX = 400
local winX, winY = love.graphics.getDimensions()
ballPos.x, ballPos.y = winX * 3 / 4, winY * 3 / 4


--------------------------------Initialization---------------------------------


function love.load()
	x = LSystem:new()

	Renderer:init()

	TurtleRenderer:construct()

	TurtleRenderer:setInput("F+fF+Ff+FF")

end

-----------------------------------Rendering-----------------------------------

function love.draw()
	if(TurtleRenderer.ready)then
		love.graphics.push("all")
		love.graphics.setColor(1,0,0)
		TurtleRenderer:draw()
		love.graphics.pop()
	else
		Renderer:draw()
	end
end

-------------------------------------Logic-------------------------------------

function love.update(d)
	Renderer:update(d)
	TurtleRenderer:update(d)
end

-------------------------------------Input-------------------------------------

keyFunctionLookup = require "src/utility/keyfunctionlookup"

function love.keypressed(key)
	if(keyFunctionLookup[key] ~= nil)then
		keyFunctionLookup[key]()
	end
end

--------------------------------Error Handling---------------------------------

function love.threaderror(thread, errorstr)
	print("Thread error: " .. errorstr)
end