local isBurstedOut = false
local oldBodyDamage = 0
local oldSpeed = 0

local function bursttires(currentVeh)
	
	if not isBurstedOut then
		isBurstedOut = true
		
		Citizen.CreateThread(function()
	local currentVeh = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false)
    SetVehicleTyreBurst(currentVeh, 0, true, 1000.0)
    SetVehicleTyreBurst(currentVeh, 1, true, 1000.0)
    SetVehicleTyreBurst(currentVeh, 2, true, 1000.0)
    SetVehicleTyreBurst(currentVeh, 3, true, 1000.0)
    SetVehicleTyreBurst(currentVeh, 4, true, 1000.0)
    SetVehicleTyreBurst(currentVeh, 5, true, 1000.0)
    Citizen.Wait(Config.DisableControlsTimer)
			isBurstedOut = false
		end)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		if DoesEntityExist(vehicle) then
			
			if Config.TiresBurstFromDamage then
				local currentDamage = GetVehicleBodyHealth(vehicle)
				
				if currentDamage ~= oldBodyDamage then
					if not isBurstedOut and (currentDamage < oldBodyDamage) and ((oldBodyDamage - currentDamage) >= Config.TiresBurstDamageRequired) then
						bursttires()
					end
					oldBodyDamage = currentDamage
				end
			end
			
			
			if Config.TiresBurstFromSpeed then
				local currentSpeed = GetEntitySpeed(vehicle) * 2.23
				
				if currentSpeed ~= oldSpeed then
					if not isBurstedOut and (currentSpeed < oldSpeed) and ((oldSpeed - currentSpeed) >= Config.TiresBurstSpeedRequired) then
						bursttires()
					end
					oldSpeed = currentSpeed
				end
			end
		else
			oldBodyDamage = 0
			oldSpeed = 0
		end
		
		if isBurstedOut and Config.DisableControlsOnTiresBurst then
			
			DisableControlAction(0,71,true) -- veh forward
			DisableControlAction(0,72,true) -- veh backwards
			DisableControlAction(0,63,true) -- veh turn left
			DisableControlAction(0,64,true) -- veh turn right
			DisableControlAction(0,75,true) -- disable exit vehicle
		end
	end
end)