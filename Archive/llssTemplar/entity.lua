
function setEntityVelocity(entity, vx, vy)
	entity.vx, entity.vy = entity.rotation:transformPoint(vx, -vy)
end

function setEntityPosition(entity,x,y)
	entity.x = x or 0
	entity.y = y or 0
	print(entity.x,entity.y)
end

function updateEntityTransform(entity)
	entity.final:reset()
	entity.final:translate(entity.x,entity.y)
	entity.final:scale(entity.sx,entity.sy)
	entity.final:apply(entity.rotation)
	entity.final:translate(-entity.ox,-entity.oy)
end

function updateEntity(entity, deltaTime)
	entity.x = entity.x + entity.vx * deltaTime
	entity.y = entity.y + entity.vy * deltaTime
	updateEntityTransform(entity)
end

--Apply thrust with direction (relative to rotation) and force decided by tx, ty
function thrustEntity(entity,tx,ty)
	local mx,my = entity.rotation:transformPoint(tx, -ty)
	entity.vx = entity.vx + mx
	entity.vy = entity.vy + my
end

function drawEntity(entity)
	love.graphics.draw(entity.mesh,entity.final)
end

function rotateEntity(entity, r)
	entity.rotation:rotate(r)
	updateEntityTransform(entity)
end

function newEntity(width, height, texture, x, y, r, sx, sy, ox, oy)

	if(width==nil or height==nil or texture==nil)then
		print("Entity initialisation error")
		return nil
	end

	--Initialise entity with supplied or default values
	entity = {
		w = width, h = height, tex = texture,
		x = x or 0  ,  y = y or 0,
		sx = sx or 1, sy = sy or 1,
		ox = ox or width/2, oy = oy or height/2,

		vx = 0, vy = 0,

		mesh = love.graphics.newMesh({{0,0,0,0},{0,height,0,1},{width,0,1,0},{width,height,1,1}},"strip"),

		rotation = love.math.newTransform(0,0,r or 0),
		final = love.math.newTransform(0,0,0,sx or 1,sy or 1),

		setVelocity = setEntityVelocity,
		setPosition = setEntityPosition,
		update = updateEntity,
		draw = drawEntity,
		thrust = thrustEntity,
		rotate = rotateEntity
	}

	entity.mesh:setTexture(texture)

	updateEntityTransform(entity)
	return entity

end


