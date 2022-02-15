require "projectile"

--[Application name] written by [Author].

--[[
Description:

What and/or how the application the application works. 


How to install run [Application name]:

An explanation of how to install and run the application.


Controls:

Explanation of how to control the application.


TODO:

Regularly updated list of changes to be made.
]]--


-- Include Dependencies.


-- Global Variables.


-- Global Functions.

-- Print anything - including nested tables
function table_print (tt, indent, done)
  done = done or {}
  indent = indent or 0
  if type(tt) == "table" then
    for key, value in pairs (tt) do
      io.write(string.rep (" ", indent)) -- indent it
      if type (value) == "table" and not done [value] then
        done [value] = true
        io.write(string.format("[%s] => table\n", tostring (key)));
        io.write(string.rep (" ", indent+4)) -- indent it
        io.write("(\n");
        table_print (value, indent + 7, done)
        io.write(string.rep (" ", indent+4)) -- indent it
        io.write(")\n");
      else
        io.write(string.format("[%s] => %s\n",
            tostring (key), tostring(value)))
      end
    end
  else
    io.write(tt .. "\n")
  end
end

-- LÖVE initialisation function.
function love.load()
	love.window.setFullscreen(false)

	sound = love.audio.newSource("assets/sounds/laser_sound.ogg", "static")
	lastime = love.timer.getTime()

	music = love.audio.newSource("assets/sounds/star-ship-battle-3113.mp3", "stream")
	music:setVolume(0.7)
	music:play()

	image = love.graphics.newImage("assets/textures/Player_base.png")
	lasimage = love.graphics.newImage("assets/textures/Player_laser.png")
	pl = newEntity(100,100,image,400,400,0,0.5,0.5)

	fireMode = 1

	newProjectile(20,30,lasimage,pl)
end


-- LÖVE game loop draw function.
function love.draw()
	-- Handle rendering calls here.
	pl:draw()
	projectileManager:draw()
end


-- LÖVE game loop update function.
function love.update(deltaTime)
	-- Handle time sensitive game logic here such as smooth movement.

	if(not music:isPlaying())then
		music:play()
	end

	--Movement key input
	if(love.keyboard.isDown("left",'a'))then
		pl:rotate(-7.5 * deltaTime)
	end

	if(love.keyboard.isDown("right",'d'))then
		pl:rotate(7.5 * deltaTime)
	end

	if(love.keyboard.isDown("up",'w'))then
		pl:thrust(0,30)
	end

	if(love.keyboard.isDown("down",'s'))then
		pl:thrust(0,-30)
	end

	if(love.keyboard.isDown("space") and love.timer.getTime() - lastime > .1)then
		sound:stop()
		sound:play()
		if(fireMode == 1) then
		newProjectile(20,30,lasimage, pl)
		elseif(fireMode == 2) then
		newProjectile(20,30,lasimage, pl, -5)
		newProjectile(20,30,lasimage, pl, 5)
		end
		lastime = love.timer.getTime()
	end

	pl:update(deltaTime)
	projectileManager:update(deltaTime)
end


-- LÖVE input handling function.
function love.keypressed(key)

	-- Open pause menu. (TODO: currently just closes the application)
	if(key == "escape")then
		love.event.quit()
	end

	--reset incase you lose the spaceship
	if(key == "r") then
		pl:setPosition(400,400)
		pl:setVelocity(0,0)
	end

	if(key == "m")then
		if(fireMode == 1)then
			fireMode = 2
		else
			fireMode = 1
		end
	end

end