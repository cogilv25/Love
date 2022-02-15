-- TODO: Explain RuleSets for users



defaultTurtleRuleSets = {}

defaultTurtleRuleSets.FfPlusMinusAndStack =
{
	_init=
	[[

	--Simple stack with pop() and push(v) functions
	stack={d={}}; 

	function stack:push(v) 
		self.d[#self.d+1] = v 
	end 

	function stack:pop() 
		local v = self.d[#self.d]
		self.d[#self.d] = nil
		return v
	end
	--Create and initialise turtle matrix
	function pushTurtleMatrix()
		output[#output+1] = love.math.newTransform():translate(turtle.pos.x,turtle.pos.y):scale(turtle.scale.x, turtle.scale.y):rotate(math.rad(turtle.rotAng))--:translate(offsetX,offsetY)
	end

	function moveForward()
		turtle.pos.x = turtle.pos.x + turtle.dir.x*turtle.distancePerMove
		turtle.pos.y = turtle.pos.y + turtle.dir.y*turtle.distancePerMove
	end

	function rotate(ang)
		turtle.rotAng = turtle.rotAng + ang
		local cosA = math.cos(math.rad(ang))
		local sinA = math.sin(math.rad(ang))
		local ox, oy = turtle.dir.x, turtle.dir.y
		turtle.dir.x = ox * cosA - oy * sinA
		turtle.dir.y = ox * sinA + oy * cosA
	end

	function pushTurtle()
		stack:push(turtle.pos.x)
		stack:push(turtle.pos.y)
		stack:push(turtle.dir.x)
		stack:push(turtle.dir.y)
		stack:push(turtle.scale.x)
		stack:push(turtle.scale.y)
		stack:push(turtle.rotAng)
		stack:push(turtle.degreesPerRotation)
		stack:push(turtle.distancePerMove)
	end

	function popTurtle()
		turtle.distancePerMove = stack:pop()
		turtle.degreesPerRotation = stack:pop()
		turtle.rotAng = stack:pop()
		turtle.scale.y = stack:pop()
		turtle.scale.x = stack:pop()
		turtle.dir.y = stack:pop()
		turtle.dir.x = stack:pop()
		turtle.pos.y = stack:pop()
		turtle.pos.x = stack:pop()
	end

	]]
}
defaultTurtleRuleSets.FfPlusMinusAndStack["f"] = 'moveForward()'
defaultTurtleRuleSets.FfPlusMinusAndStack["F"] = 'pushTurtleMatrix();moveForward()'
defaultTurtleRuleSets.FfPlusMinusAndStack["+"] = 'rotate(turtle.degreesPerRotation)'
defaultTurtleRuleSets.FfPlusMinusAndStack["-"] = 'rotate(-turtle.degreesPerRotation)'
defaultTurtleRuleSets.FfPlusMinusAndStack["["] = 'pushTurtle()'
defaultTurtleRuleSets.FfPlusMinusAndStack["]"] = 'popTurtle()'