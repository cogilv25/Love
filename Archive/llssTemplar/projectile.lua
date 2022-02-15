require "entity"

projectileManager = {nProjectiles = 0, first = 0, last = 0}

function projectileManager.addProjectile(self, projectile)
	self[self.last] = projectile
	self.last = self.last + 1
end


function projectileManager.update(self, deltaTime)
	if(self.last-self.first > 0)then
		local currentTime = love.timer.getTime()
		 for i=self.first,self.last-1,1 do
			if(self[i].birth + 2 < currentTime)then
				self[i] = nil
				self.first = self.first + 1
			else
				self[i]:update(deltaTime)
			end
		end
	end
end

function projectileManager.draw(self)
	if(self.last-self.first > 0)then
		for i = self.first,self.last-1,1 do
			self[i]:draw()
		end
	end
end

function newProjectile(width, height, texture, entity, ox, oy)
	ox = ox or 0
	oy = oy or 0
	local projectile = newEntity(width, height, texture, entity.x, entity.y)
	projectile.birth = love.timer.getTime()
	projectile.rotation = entity.rotation:clone()
	projectile:thrust(0,400)

	local tx,ty = projectile.rotation:transformPoint(ox,oy)
	projectile.x = projectile.x + tx
	projectile.y = projectile.y + ty


	projectileManager:addProjectile(projectile)
end