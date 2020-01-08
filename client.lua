player = PlayerId()

reasonBullets = {
	"killed",
	"shot",
	"2nd amendmented",
	"decomissioned",
	"3rd worlded",
	"annihilated",
	"ended",
	"deaded",
	"smoked",
	"capped",
	"clipped",
	"clocked",
	"whacked",
	"crossed out",
	"punctuated",
	"popped",
	"machined",
	"armied",
	"manslaughtered",
	"terminated"
}

reasonSniper = {
	"lightning bolted",
	"brought down",
	"high-calibered",
	"assassinated",
	"sniped"
}

reasonRifle = {
	"ended",
	"rifled",
	"shot down",
	"floored"
}

reasonSMG = {
	"riddled",
	"drilled",
	"submachine gunned",
	"ruined",
	"SMGed"
}

reasonShotgun = {
	"pulverised",
	"shotgunned"
}

reasonPistol = {
	"pistoled",
	"blasted",
	"plugged"
}

reasonMelee = {
	"pummeled",
	"broke",
	"smashed",
	"beat down",
	"brained",
	"homered",
	"battered",
	"hammered",
	"cracked",
	"bludgeoned",
	"melee killed",
	"whacked",
	"murdered"	
}

reasonKnife = {
	"spiked",
	"striped",
	"stuck it to",
	"knifed",
	"eviscerated"
}

reasonExplosives = {
	"vaporized",
	"fucked up",
	"totaled",
	"shock-and-awed",
	"blew up",
	"blitzed",
	"blatzed",
	"bombed",
	"detonated"
}

reasonFire = {
	"flame grilled",
	"roasted",
	"butchered",
	"charred",
	"cooked",
	"torched"
}

reasonVehicle = {
	"steamrolled",
	"flattened",
	"plowed",
	"accidented",
	"splattered",
	"ran over"
}

weaponsPistols = {
	`weapon_pistol`,
	`weapon_pistol_mk2`,
	`weapon_combatpistol`,
	`weapon_appistol`,
	`weapon_pistol50`,
	`weapon_snspistol`,
	`weapon_snspistol_mk2`,
	`weapon_heavypistol`,
	`weapon_vintagepistol`,
	`weapon_marksmanpistol`,
	`weapon_revolver`,
	`weapon_revolver_mk2`,
	`weapon_doubleaction`,
	`weapon_ceramicpistol`,
	`weapon_navyrevolver`
}

weaponsShotguns = {
	`weapon_pumpshotgun`,
	`weapon_pumpshotgun_mk2`,
	`weapon_sawnoffshotgun`,
	`weapon_assaultshotgun`,
	`weapon_bullpupshotgun`,
	`weapon_heavyshotgun`,
	`weapon_dbshotgun`,
	`weapon_autoshotgun`,
	`weapon_musket`
}

weaponsRifles = {
	`weapon_assaultrifle`,
	`weapon_assaultrifle_mk2`,
	`weapon_carbinerifle`,
	`weapon_carbinerifle_mk2`,
	`weapon_advancedrifle`,
	`weapon_specialcarbine`,
	`weapon_specialcarbine_mk2`,
	`weapon_bullpuprifle`,
	`weapon_bullpuprifle_mk2`,
	`weapon_compactrifle`
}

RegisterNetEvent("deathmessages:notifyDeath")
RegisterNetEvent("deathmessages:notifyMurder")
AddEventHandler("deathmessages:notifyDeath", function(victimID)
	-- Check if you are the victim
	local victimString
	if GetPlayerFromServerId(victimID) == PlayerId() then
		victimString = "you"
	else
		victimString = printPlayerName(GetPlayerFromServerId(victimID))
	end

	notify(victimString .. " died.")
end)

AddEventHandler("deathmessages:notifyMurder", function(victimID, killerID, weapon, killerInVehicle)
	local victimString = printPlayerName(GetPlayerFromServerId(victimID))
	local reason, isKillerNPC, isPlayerKiller, killerString

	if GetPlayerFromServerId(victimID) == PlayerId() then
		victimString = "you"
	else
		victimString = printPlayerName(GetPlayerFromServerId(victimID))
	end

	-- Check if the killer is an NPC or a player
	if killerID == -1 then
		isKillerNPC = true
	else
		isKillerNPC = false
		killerString = printPlayerName(GetPlayerFromServerId(killerID))
	end

	-- Check if you are the killer
	if GetPlayerFromServerId(killerID) == PlayerId() then
		killerString = "you"
	end

	-- Check what type of weapon the player was killed by
	-- Pistol
	if TableHasValue(weaponsPistols, weapon) then
		reasons = TableConcat(reasonPistol, reasonBullets)
		reason = reasons[math.random(#reasons)]
	-- Shotgun
	elseif TableHasValue(weaponsShotguns, weapon) then
		reasons = TableConcat(reasonShotgun, reasonBullets)
		reason = reasons[math.random(#reasons)]
	-- Assault rifle
	elseif TableHasValue(weaponsRifles, weapon) then
		reasons = TableConcat(reasonRifle, reasonBullets)
		reason = reasons[math.random(#reasons)]
	-- Ran over by car
	elseif killerInVehicle then
		reason = reasonVehicle[math.random(#reasonVehicle)]
	else
		reason = "killed"
	end

	-- Create the kill message
	if isKillerNPC then
		notify(victimString .. " died.")
	else
		notify(killerString .. " " .. reason .. " " .. victimString .. ".")
	end
end)

-- If the player is killed

--[[
	killerID is the player ID of the killer. Returns -1 if killed by an NPC.
]]
AddEventHandler("baseevents:onPlayerKilled", function(killerID, deathData)
	-- Killed by a cop
	if deathData.killertype == 6 or deathData.killertype == 27  then
	elseif deathData.killerinveh then
	end
	TriggerServerEvent("deathmessages:broadcastMurder", GetPlayerServerId(player), killerID, deathData.weaponhash, deathData.killerinveh)
end)

-- If the player dies
AddEventHandler("baseevents:onPlayerDied", function()
	TriggerServerEvent("deathmessages:broadcastDeath", GetPlayerServerId(player))
end)

function notify(text)
	SetNotificationTextEntry("STRING")
	-- Automatically capitalize the first letter
    AddTextComponentString(text:gsub("^%l", string.upper))
    DrawNotification(true, true)
end

function printPlayerName(playerID)
	local playerString = "<C>" .. GetPlayerName(playerID) .. "</C>"
	return playerString
end

-- Merge 2 tables
function TableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

-- Check if a table contains a specific value
function TableHasValue (table, value)
    for i=1,#table do
        if table[i] == value then
            return true
        end
    end
    return false
end