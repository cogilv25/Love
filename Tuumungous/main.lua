-- Written by Calum Lindsay.

-- Internal includes

-- Modifiable global variables
-- (Modifying these will change the behaviour of the program)

screenWidth = 1920
screenHeight = 1080

mapHeight = 10
mapWidth = 10

-- Un-modifiable global variables
-- (Just for information as the program will overwrite your changes)

tileWidth = 0
tileHeight = 0
map = {}
for i=1,mapHeight do
	map[i]= {}
end

textures = 0
textureNameMap = {}

--------------------------------Initialization---------------------------------
function getTextureIDFromPath(path)
	return textureNameMap[path]
end

function recursiveGetAllFilePaths(path)
	local tab = {}
	local dirPaths = love.filesystem.getDirectoryItems(path)
	for i=1,#dirPaths do
		local type = love.filesystem.getInfo(path.."/"..dirPaths[i])["type"]
		if(type == "directory")then
			local temp = recursiveGetAllFilePaths(path.."/"..dirPaths[i])
			for j=1,#temp do
				table.insert(tab,temp[j])
			end
		else
			table.insert(tab,path.."/"..dirPaths[i])
		end
	end
	return tab
end



function loadAssets()
	print("Loading Assets...")
	assetPaths = recursiveGetAllFilePaths("assets")
	for i=1, #assetPaths do
		textureNameMap[assetPaths[i]] = i
		print("->"..assetPaths[i])
	end
	print("\nGenerating ArrayImage...")
	textures = love.graphics.newArrayImage(assetPaths)
	print("Done.")

end


function love.load()
	love.window.setMode(screenWidth, screenHeight)
	loadAssets()

	-- Load operator images from file
	--[[local path = love.filesystem.getDirectoryItems("Assets")

	for i=1,#path do
		ops[i] = path[i]
		path[i] = "assets/operators/" .. path[i]
	end

	table.insert(path,1,"assets/ball.png")

	images = love.graphics.newArrayImage(path);

	for i=1, #ops do
		print(i+1 .. ": " .. ops[i])
	end]]
end

-----------------------------------Rendering-----------------------------------

function love.draw()
	love.graphics.drawLayer(textures,1,0,0,0,1,1,32,32)
	love.graphics.drawLayer(textures,1,0,32,0,1,1,32,32)
	love.graphics.drawLayer(textures,1,32,0,0,1,1,32,32)
	love.graphics.drawLayer(textures,1,32,32,0,1,1,32,32)
	--[[ Draw Map
	for i=1,mapHeight do
		for j=1, mapWidth do
			map[i][j]:draw(j,i,500,250)
		end
	end
	-- Draw Ball
	--	love.graphics.drawLayer(images,1,ball[1][1],ball[1][2],0,1,1,16,16)
	-- Ball Text	
	-- love.graphics.print(tostring(ball[3]),ball[1][1],ball[1][2],0,1,1,4,8)]]
end

-------------------------------------Logic-------------------------------------

function love.update(d)
	-- Up and Down Input
	if(love.keyboard.isDown("w","up")) then
		rawr = rawr + 1
	end

	-- Perform ops
	--local ballGridPos = {math.floor((ball[1][1]-100)/32),math.floor((ball[1][2]-100)/32)}

	--if(ballGridPos[1] ~= bgp[1] or ballGridPos[2] ~= bgp[2]) then
		--print("Ball Grid Pos: (" .. ballGridPos[1] .. ", " .. ballGridPos[2] .. ")")
	--	bgp[1] = ballGridPos[1]
	--	bgp[2] = ballGridPos[2]
	--end

	--opFuncs[map[ballGridPos[2]][ballGridPos[1]][1]](ball,map[ballGridPos[2]][ballGridPos[1]][2],d)
	


	--ball[1][1] = ball[1][1] + ball[2][1]*d
	--ball[1][2] = ball[1][2] + ball[2][2]*d
end

-------------------------------------Input-------------------------------------

function love.keypressed(key)
	if(key == "escape") then
		love.event.quit()
	end
end

--------------------------------Error Handling---------------------------------

function love.threaderror(thread, errorstr)
	print("Thread error: " .. errorstr)
end