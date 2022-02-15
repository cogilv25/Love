local lsystem = LSystemGenerator:new()

lsystem.name = "Plant 1"
lsystem.initialState = "F"
lsystem.angle = 25.7
lsystem.rules = {F = "F[+F]F[-F]F"}

return lsystem