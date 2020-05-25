player = PlayerId()
networkIndex = NetworkGetPlayerIndexFromPed(GetPlayerPed(-1))

reasonSniper = {
	"sniped",
	"picked off",
	"scoped",
	"assassinated",
	"brought down",
	"caught out",
	"high-calibered",
	"lightning bolted",
	"nailed",
	"picked off",
	"struck down",
	"surprised"
}

reasonRifle = {
	"ended",
	"rifled",
	"shot down",
	"floored",
	"3rd worlded",
	"annihilated",
	"armied",
	"decommissioned",
	"drilled",
	"ended",
	"killed",
	"machined",
	"punctuated",
	"terminated"
}

reasonSMG = {
	"riddled",
	"drilled",
	"submachine gunned",
	"ruined",
	"SMGed",
	"cancelled",
	"crossed out",
	"cut down",
	"massacered",
	"peppered",
	"plugged",
	"riddled",
	"sprayed",
	"ventilated"
}

reasonLMG = {
	"machine gunned",
	"sprayed"
}

reasonShotgun = {
	"pulverised",
	"shotgunned",
	"12 bored",
	"blew away",
	"double barreled",
	"farmed",
	"opened up",
	"perforated",
	"pumped",
	"put a load in",
	"shelled",
	"shottied"
}

reasonPistol = {
	"pistoled",
	"blasted",
	"plugged",
	"2nd amendmented",
	"capped",
	"clipped",
	"clocked",
	"deaded",
	"popped",
	"shot",
	"smoked",
	"whacked"
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
	"filleted",
	"cut up",
	"slashed",
	"stabbed"
}

reasonExplosives = {
	"vaporized",
	"fucked up",
	"totaled",
	"shock & awed",
	"blew up",
	"blitzed"
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

reasonRPG = {
	"exploded",
	"obliterated",
	"destroyed",
	"erased"
}

reasonGrenade = {
	"bombed",
	"detonated"
}

reasonVehicle = {
	"steamrolled",
	"flattened",
	"plowed",
	"accidented",
	"splattered",
	"ran over",
	"gouranga'd",
	"hut and runned",
	"manslaughtered",
	"shocked"
}

reasonHelicopter = {
	"mowed down",
	"chopped up",
	"fucked up",
	"pulverized",
	"shocked & awed",
	"totaled",
	"vaporized"
}

reasonSuicide = {
	"commited suicide"
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

weaponsGrenades = {
	`weapon_grenade`,
	`weapon_stickybomb`,
	`weapon_proxmine`,
	`weapon_pipebomb`
}

weaponsLaunchers = {
	`weapon_rpg`,
	`weapon_grenadelauncher`,
	`weapon_railgun`,
	`weapon_hominglauncher`,
	`weapon_compactlauncher`
}

weaponsFire = {
	`weapon_molotov`,
	`weapon_flare`,
	`weapon_flaregun`
}

RegisterNetEvent("deathmessages:notifyDeath")
RegisterNetEvent("deathmessages:notifyMurder")
AddEventHandler("deathmessages:notifyDeath", function(victimIndex, killer)
	-- Check if you are the victim
	local victimString
	local string = GenerateDeathReason(victimIndex, killer)
	if victimIndex == networkIndex then
		victimString = "you"
	else
		victimString = printPlayerName(victimIndex)
	end

	--TriggerEvent("notifications:Notify", (victimString .. string))
	TriggerEvent("notifications:Notify", victimString .. string)
end)

AddEventHandler("deathmessages:notifyMurder", function(victimIndex, killerIndex, string, killerInVehicle, killerType)
	--local victimString = printPlayerName(GetPlayerFromServerId(victimID))
	local reason, isKillerNPC, isPlayerKiller, killerString

	if victimIndex == networkIndex then
		victimString = "you"
	else
		victimString = printPlayerName(victimIndex)
	end

	killerString = printPlayerName(killerIndex)

	-- Check if you are the killer
	if killerIndex == networkIndex then
		killerString = "you"
	end

	TriggerEvent("notifications:Notify", killerString .. " " .. string .. " " .. victimString .. ".")
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
	print(NetworkGetPlayerIndexFromPed(GetPlayerPed(-1)))
	-- Killed by a cop
	--if deathData.killertype == 6 or deathData.killertype == 27  then
	--elseif deathData.killerinveh then
	--end
	TriggerServerEvent("deathmessages:broadcastMurder", networkIndex, killerIndex, string, deathData.killerinveh, deathData.killertype)
end)

-- If the player dies
AddEventHandler("baseevents:onPlayerDied", function()
	local killerEntity, weapon = NetworkGetEntityKillerOfPlayer(player)
	print(IsEntityAPed(GetPedSourceOfDeath(GetPlayerPed(-1))))
	local killer = GetPedSourceOfDeath(GetPlayerPed(-1))
	TriggerServerEvent("deathmessages:broadcastDeath", networkIndex, GetPedType(killer))
end)

function notify(text)
	SetNotificationTextEntry("STRING")
	-- Automatically capitalize the first letter
    AddTextComponentString(text:gsub("^%l", string.upper))
    DrawNotification(true, true)
end

function printPlayerName(index)
	local playerString = "~HUD_COLOUR_NET_PLAYER" .. GetPlayerServerId(index) .. "~<C>" .. GetPlayerName(index) .. "</C>~HUD_COLOUR_PURE_WHITE~"
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

-- Check what type of weapon the player was killed by
function GenerateKillReason(weapon, killerInVehicle)
	local reason

	-- Pistol
	if TableHasValue(weaponsPistols, weapon) then
		--reasons = TableConcat(reasonPistol, reasonBullets)
		reason = reasonPistol[math.random(#reasonPistol)]
	-- Shotgun
	elseif TableHasValue(weaponsShotguns, weapon) then
		--reasons = TableConcat(reasonShotgun, reasonBullets)
		reason = reasonShotgun[math.random(#reasonShotgun)]
	-- Assault rifle
	elseif TableHasValue(weaponsRifles, weapon) then
		--reasons = TableConcat(reasonRifle, reasonBullets)
		reason = reasonRifle[math.random(#reasonRifle)]
	-- Sniper rifle
	elseif TableHasValue(weaponsSnipers, weapon) then
		--reasons = TableConcat(reasonSniper, reasonBullets)
		reason = reasonSniper[math.random(#reasonSniper)]
	-- Sub machine gun
	elseif TableHasValue(weaponsSMGs, weapon) then
		--reasons = TableConcat(reasonSMG, reasonBullets)
		reason = reasonSMG[math.random(#reasonSMG)]
	-- Light machine gun
	elseif TableHasValue(weaponsLMGs, weapon) then
		reason = reasonLMG[math.random(#reasonLMG)]
	elseif TableHasValue(weaponsGrenades, weapon) then
		reasons = TableConcat(reasonGrenade, reasonExplosives)
		reason = reasons[math.random(#reasons)]
	elseif TableHasValue(weaponsLaunchers, weapon) then
		reasons = TableConcat(reasonRPG, reasonExplosives)
		reason = reasons[math.random(#reasons)]
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

function GenerateDeathReason(victimIndex, killer)
	local string
	if IsEntityInWater(GetPlayerPed(victimIndex)) then
		string = " drowned."
	elseif killer == 6 or killer == 27 then
		if GetPlayerPed(victimIndex) == GetPlayerPed(-1) then
			string = " were brought to justice."
		else
			string = " was brought to justice."
		end
	elseif killer == 28 then
		if IsPedModel(killer, GetHashKey("a_c_mtlion")) then
			string = " was mauled by a mountain lion."
		elseif IsPedModel(killer, GetHashKey("a_c_sharkhammer")) or IsPedModel(killer, GetHashKey("a_c_sharktiger")) then
			string = " eaten by a shark."
		end
	else
		string = " died."
	end

	return string
end