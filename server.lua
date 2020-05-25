RegisterServerEvent("deathmessages:broadcastDeath")
RegisterServerEvent("deathmessages:broadcastMurder")

AddEventHandler("deathmessages:broadcastDeath", function(victimIndex, killer)
	--print(victimName .. " died")
	TriggerClientEvent("deathmessages:notifyDeath",-1, victimIndex, killer)
end)

AddEventHandler("deathmessages:broadcastMurder", function(victimIndex, killerIndex, string, killerInVehicle, killerType)
	--print("Victim: " .. GetPlayerName(victimIndex))
	--print("Killer: " .. GetPlayerName(killerIndex))
	print(killerInVehicle)
	TriggerClientEvent("deathmessages:notifyMurder",-1, victimIndex, killerIndex, string, killerInVehicle, killerType)
end)