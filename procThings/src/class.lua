Class = {}

function Class:augment (class)
	local class = {} or class
	--set class/object metatable to parent
	setmetatable(class, self)
	self.__index = self
	class.parent = self
	return class
end

function Class:new(object)
	object = self:augment(object or {})
	local parents = {}
	local parent = getmetatable(object)
	while (parent ~= nil) do
		parents[#parents+1] = parent
		parent = getmetatable(parent)
	end
	for x = #parents, 1, -1 do
		parents[x].construct(object)
	end
	return object
end

function Class:construct()
	--To be implemented by classes
end