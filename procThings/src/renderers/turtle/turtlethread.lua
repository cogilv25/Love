-- ruleSet is a table to tell the turtle what to do upon encountering a specific character in the input
-- it basically is just a lookup table with the key being a char and the value being a function. For
-- more information look at turtle.lua or in the docs
--
-- input is a sequence of characters that defines the path the turtle takes
-- turtle is a table to keep track of the turtle's position, rotation and scale.
-- imports is a table of lua files to import
input, turtle, ruleSet, imports, settings = ...

--------------------------------------- Initialization -----------------------------------------------

map = {}
status = true
messages = {}
com = love.thread.getChannel( "com" )
output = {}


--Validate arguments

if(input == nil or turtle == nil or ruleSet == nil or settings == nil)then
	status = false
	messages[#messages] = "Missing argument/s in turtlethread"
else
	-- TODO: Validate imports

	for k, v in pairs(imports) do
		require(v)
		-- TODO: Yield if asked
	end

	--Validate ruleSet
	for n, f in pairs(ruleSet) do
		map[n] = loadstring(f)
		if(map[n] == nil )then
			status = false
			messages[#messages+1] = "Failed to load " .. n .. " function in turtlethread"
			messages[#messages+1] = map[n]
		end
		-- TODO: Yield if asked
	end

end

com:push(status)

if (status == false) then
	-- If there were any errors during init we
	-- report them here and exit
	for k, m in pairs(messages) do
		com:push(m)
	end
else

-------------------------------------- Generate output ------------------------------------------

	if(map._init ~= nil)then
		map._init();
	end

	if (not settings.dummyCharacters) then
		for char in input:gmatch"."do
			map[char]()
			-- TODO: Yield if asked
		end
	else
		for char in input:gmatch"."do
			if(map[char]~= nil)then
				map[char]()
			end
			-- TODO: Yield if asked
		end
	end

---------------------------------- Output generated table ------------------------------------
	com:push(true)
	for k,v in pairs(output) do
		com:push(v)
		-- TODO: Yield if asked
	end
	love.thread.getChannel( "waitToExit" ):demand()
end