--- For now only activates optional sowing machines, for example a roller with a sowing machine configuration.
---@class SowingMachineController : ImplementController
SowingMachineController = CpObject(ImplementController)

function SowingMachineController:init(vehicle, implement)
    ImplementController.init(self, vehicle, implement)
    self.sowingMachineSpec = self.implement.spec_sowingMachine
end

function SowingMachineController:update()
	if not self.settings.optionalSowingMachineEnabled:getIsDisabled() then
		if self.settings.optionalSowingMachineEnabled:getValue() then 
			--- Makes sure the sowing machine get's turned on
			if not self.implement:getIsTurnedOn() then
				self.implement:setIsTurnedOn(true)
			end
		else 
			--- Makes sure the sowing machine is turned off if not needed.
			if self.implement:getIsTurnedOn() then
				self.implement:setIsTurnedOn(false)
			end
		end
	end
end

function SowingMachineController:onFinished()
    self.implement:setIsTurnedOn(false)
end