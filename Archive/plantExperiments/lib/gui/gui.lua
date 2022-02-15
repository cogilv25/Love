require "lib/gui/menu"

GUI = {}

function GUI:draw()
	love.graphics.setColor({255,255,255})
	if paused then
		love.graphics.setFont(menuHeaderFont)
		love.graphics.printf("Paused", SCREENWIDTH/2-200, 5,400,"center")
		if highlightedMenuItem ~= 1 then
			love.graphics.setColor({178,178,178})
		end
		love.graphics.setFont(menuHeader2Font)
		love.graphics.printf("Continue", SCREENWIDTH/2-200, 75,400,"center")
		if highlightedMenuItem == 2 then
			love.graphics.setColor({255,255,255})
		else
			love.graphics.setColor({178,178,178})
		end
		love.graphics.printf("Exit", SCREENWIDTH/2-200, 115,400,"center")
	else
		love.graphics.setFont(menuHeader3Font)
		love.graphics.printf("Score: " .. scores[1], SCREENWIDTH/2-50, 5,100,"center")
	end
end

function GUI:update()
	if paused then
		highlightedMenuItem = 0
		if(love.mouse.getX() > SCREENWIDTH/2-200 and love.mouse.getX() < SCREENWIDTH/2+200)then
			if(love.mouse.getY()>75)then
				if(love.mouse.getY() > 115)then
					if(love.mouse.getY() < 160)then
						highlightedMenuItem = 2
						if(love.mouse.isDown(1))then
							love.event.quit()
						end
					end
				else
					highlightedMenuItem = 1
					if(love.mouse.isDown(1))then
						paused = false
					end
				end
			end
		end
	end
end

return GUI