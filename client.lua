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

reasonLMG = {
	"machine gunned",
	"sprayed"
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

reasonMinigun = {
	"ripped apart",
	"torn apart",
	"wiped out"
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
	"eviscerated",
	"diced",
	"filleted"
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
	"barbecued",
	"blazed",
	"burnt",
	"cindered",
	"cooked",
	"flame grilled",
	"ignited",
	"roasted",
	"charred",
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

reasonHelicopter = {
	"mowed down",
	"chopped up"
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

weaponsSnipers = {
	`weapon_sniperrifle`,
	`weapon_heavysniper`,
	`weapon_heavysniper_mk2`,
	`weapon_marksmanrifle`,
	`weapon_marksmanrifle_mk2`
}

weaponsSMGs = {
	`weapon_microsmg`,
	`weapon_smg`,
	`weapon_smg_mk2`,
	`weapon_assaultsmg`,
	`weapon_combatpdw`,
	`weapon_machinepistol`,
	`weapon_minismg`
}

weaponsLMGs = {
	`weapon_mg`,
	`weapon_combatmg`,
	`weapon_combatmg_mk2`,
	`weapon_gusenberg`
}

weaponsMelee = {
	`weapon_bat`,
	`weapon_crowbar`,
	`weapon_flashlight`,
	`weapon_golfclub`,
	`weapon_hammer`,
	`weapon_nightstick`,
	`weapon_wrench`,
	`weapon_poolcue`
}

weaponsKnives = {
	`weapon_dagger`,
	`weapon_bottle`,
	`weapon_knife`,
	`weapon_machete`,
	`weapon_switchblade`,
	`weapon_nightstick`,
}

weaponsExplosives = {
	`weapon_grenade`,
	`weapon_stickybomb`,
	`weapon_proxmine`,
	`weapon_pipebomb`
}

weaponsFire = {
	`weapon_molotov`,
	`weapon_flare`,
	`weapon_flaregun`
}

RegisterNetEvent("deathmessages:notifyDeath")
RegisterNetEvent("deathmessages:notifyMurder")
AddEventHandler("deathmessages:notifyDeath", function(victimName)
	-- Check if you are the victim
	local victimString
	if victimName == GetPlayerName(player) then
		victimString = "you"
	else
		victimString = printPlayerName(victimName)
	end

	notify(victimString .. " died.")
end)

AddEventHandler("deathmessages:notifyMurder", function(victimName, killerName, string, killerInVehicle, killerType)
	--local victimString = printPlayerName(GetPlayerFromServerId(victimID))
	local reason, isKillerNPC, isPlayerKiller, killerString

	if victimName == GetPlayerName(player) then
		victimString = "you"
	else
		victimString = printPlayerName(victimName)
	end

	-- Check if the killer is an NPC or a player
	--if killerID == -1 then
	--	isKillerNPC = true
	--else
		--isKillerNPC = false
	killerString = printPlayerName(killerName)
	--end

	-- Check if you are the killer
	if killerName == GetPlayerName(player) then
		killerString = "you"
	end

	-- Create the kill message
	--if isKillerNPC then
	--	if not victimString == "you" and killerType == 6 or killerType == 27 then
	--		notify(victimString .. " was killed by cops.")
	--	elseif killerType == 28 then
	--		notify(victimString .. " was mauled to death by an animal.")
	--	else
	--		notify(victimString .. " died.")
	--	end
	--else
	notify(killerString .. " " .. string .. " " .. victimString .. ".")
	--end
end)

-- If the player is killed

--[[
	killerID is the player ID of the killer. Returns -1 if killed by an NPC.
]]
AddEventHandler("baseevents:onPlayerKilled", function(killerID, deathData)
	local killerEntity, weapon = NetworkGetEntityKillerOfPlayer(player)
	local killerIndex = NetworkGetPlayerIndexFromPed(killerEntity)
	local killerName = GetPlayerName(killerIndex)
	local string = GenerateKillReason(deathData.weaponhash, deathData.killerinveh)
	-- Killed by a cop
	--if deathData.killertype == 6 or deathData.killertype == 27  then
	--elseif deathData.killerinveh then
	--end
	TriggerServerEvent("deathmessages:broadcastMurder", GetPlayerName(player), killerName, string, deathData.killerinveh, deathData.killertype)
end)

-- If the player dies
AddEventHandler("baseevents:onPlayerDied", function()
	TriggerServerEvent("deathmessages:broadcastDeath", GetPlayerName(player))
end)

function notify(text)
	SetNotificationTextEntry("STRING")
	-- Automatically capitalize the first letter
    AddTextComponentString(text:gsub("^%l", string.upper))
    DrawNotification(true, true)
end

function printPlayerName(playerName)
	local playerString = "<C>" .. playerName .. "</C>"
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

function GenerateKillReason(weapon, killerInVehicle)
	local reason

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
	-- Sniper rifle
	elseif TableHasValue(weaponsSnipers, weapon) then
		reasons = TableConcat(reasonSniper, reasonBullets)
		reason = reasons[math.random(#reasons)]
	-- Sub machine gun
	elseif TableHasValue(weaponsSMGs, weapon) then
		reasons = TableConcat(reasonSMG, reasonBullets)
		reason = reasons[math.random(#reasons)]
	-- Light machine gun
	elseif TableHasValue(weaponsLMGs, weapon) then
		reason = reasonBullets[math.random(#reasonBullets)]
	-- Molotov
	elseif weapon == `weapon_molotov` then
		reason = reasonFire[math.random(#reasonFire)]
	-- Helicopter blades
	elseif weapon == `vehicle_weapon_rotors` then
		reason = reasonHelicopter[math.random(#reasonHelicopter)]
	-- Ran over by car
	elseif killerInVehicle then
		reason = reasonVehicle[math.random(#reasonVehicle)]
	else
		reason = "killed"
	end

	return reason
end