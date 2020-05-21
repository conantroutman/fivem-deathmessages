RegisterServerEvent("deathmessages:broadcastDeath")
RegisterServerEvent("deathmessages:broadcastMurder")

AddEventHandler("deathmessages:broadcastDeath", function(victimName)
	print(victimName .. " died")
	TriggerClientEvent("deathmessages:notifyDeath",-1, victimName)
end)

AddEventHandler("deathmessages:broadcastMurder", function(victimName, killerName, string, killerInVehicle, killerType)
	print("Victim: " .. victimName)
	print("Killer: " .. killerName)
	print(killerInVehicle)
	TriggerClientEvent("deathmessages:notifyMurder",-1, victimName, killerName, string, killerInVehicle, killerType)
end)