-- Food class
require "lib/game/vector"

Food = Object:extend()

function Food:new(x,y,energy)
	self.pos = Vector(x,y)

	-- Energy level when food respawns
	self.energy = energy or 1
	self.eaten = false
end

function Food:update()
	if(self.pos == grid.snake.segments[1])then
		grid:spawnFood()
	elseif(self.pos == grid.snake.segments[#grid.snake.segments])then
		self.eaten = true
	end
	if(self.eaten)then
		score = score + 1
		grid.snake.grow = true
		self.energy = self.energy -1
	end
end