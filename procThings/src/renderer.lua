Renderer = Class:augment()

--Default Values
Renderer.scale = 1
--Input formats that can be used to change
--how the renderer functions internally
Renderer.inputFormats = {"Text"}
Renderer.activeInputFormat = 1
--Continue to call update on the renderer when another 
--renderer is being drawn
Renderer.updateInBackground = false


--Default Init function
function Renderer:init()
	self.ball = {pos={},vel={}}
	self.windim = {}
	self.windim.x, self.windim.y = love.graphics.getDimensions()

	self.ball.pos.x = self.windim.x / 2
	self.ball.pos.y = self.windim.y * 3/4
	self.ball.vel.x = 200
	self.ball.vel.y = 200
end

--Default Draw function
function Renderer:draw()
	love.graphics.setColor({.25,.25,.25})
	love.graphics.rectangle("fill",0,0,self.windim.x,self.windim.y)
	love.graphics.setFont(love.graphics.newFont(self.windim.x/10))
	love.graphics.setColor({.7,0,1})
	love.graphics.printf("Oops\nDraw\nFunction\nMissing!!!", self.windim.x / 2 - self.windim.x / 4, self.windim.y / 10, self.windim.x / 2,"center")

	love.graphics.rectangle("fill",self.ball.pos.x,self.ball.pos.y,30,30)
end

--Default Update function
function Renderer:update(deltaTime)
	self.windim.x, self.windim.y = love.graphics.getDimensions()

	self.ball.pos.y = self.ball.pos.y + self.ball.vel.y * deltaTime
	self.ball.pos.x = self.ball.pos.x + self.ball.vel.x * deltaTime

	if(self.ball.pos.y >= self.windim.y -30)then
		self.ball.vel.y = -self.ball.vel.y
		self.ball.pos.y = self.windim.y -30
	end
	if(self.ball.pos.x >= self.windim.x -30 or self.ball.pos.x <= 0)then
		self.ball.vel.x = -self.ball.vel.x
	end
	self.ball.vel.y = self.ball.vel.y + 550 * deltaTime

end

--Constructor
function Renderer:construct()

end