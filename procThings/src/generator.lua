Generator = Class:augment()


Generator.defaultOperation = function() print("No function provided to perform operation") end

--Required Fields for child classes
Generator.stepForward = Generator.defaultOperation
Generator.stepBack = Generator.defaultOperation

function Generator:construct()

	--Defaults
	self.outputFormats = self.outputFormats or {"Text"}
	self.inputFormats = self.inputFormats or {"Text"}
	self.activeOutputFormat = self.activeOutputFormat or 1
	self.activeInputFormat = self.activeInputFormat or 1
end