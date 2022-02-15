require "src/renderers/turtle/defaultturtlerulesets"
TurtleSettings = Class:augment()

function TurtleSettings:construct()

end

--default values

TurtleSettings.entity=
{
	pos = {x=0,y=0},
	scale = {x=1,y=1},
	dir = {x=0,y=-1},
	rotAng = 0,
	degreesPerRotation = 90,
	distancePerMove = 10
}

TurtleSettings.vertices=
{
	{0,0,0,0},
	{0,10,0,1},
	{10,0,1,0},
	{10,10,1,1}
}

TurtleSettings.mesh = love.graphics.newMesh(TurtleSettings.vertices, "strip")

TurtleSettings.threadImports =
{
	"love.math"
}

TurtleSettings.threadSettings = 
{
	dummyCharacters = true
}

TurtleSettings.ruleSet = defaultTurtleRuleSets.FfPlusMinusAndStack
