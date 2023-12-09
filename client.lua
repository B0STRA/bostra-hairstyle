if Config.QB then
	QBCore = exports["qb-core"]:GetCoreObject()
end

OriginalHair = GetResourceKvpInt("bostra-hairstyle:originalHair")

function SendNotify(message, type)
	if not Config.Notify or Config.Notify == nil then
		return
	end
	if Config.Notify ~= "ox" then
		QBCore.Functions.Notify(message, type)
	else
		lib.Notify({ title = "Hair Styling", description = message, type = type })
	end
end

function IsPlayerMale(player)
	return GetEntityModel(player) == `mp_m_freemode_01`
end

function SetPlayerHair(player, newStyle)
	SetPedComponentVariation(player, 2,
		GetPedDrawableVariation(player, 2) == newStyle and OriginalHair or newStyle, 0, 0)
end

function StartScene()
	local propModel = Config.PropName
	lib.requestModel(propModel)
	SetModelAsNoLongerNeeded(propModel)
	lib.requestAnimDict("switch@franklin@lamar_tagging_wall")
	lib.requestAnimDict("ebrwny_spray")
	lib.requestNamedPtfxAsset("core")
	local particleColor = { R = 255, G = 255, B = 255 }
	UseParticleFxAssetNextCall("core")
	local propObject = CreateObject(propModel, 0, 0, 0, true, true, true)
	AttachEntityToEntity(propObject, cache.ped, 72, 0.038462107527153, -0.059969861706126, -0.025835640614247,
		-21.457779490453, 80.67627373586, 47.262632425591, true, true, false, true, 1, true)
	TaskPlayAnim(cache.ped, "switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", 8.0, 8.0, -1, 48, 0,
		false, false, false)
	Wait(5000)
	TaskPlayAnim(cache.ped, "ebrwny_spray", "ebrwny_hair", 8.0, 8.0, -1, 16, 0, true, false, false)
	Wait(1500)
	local particleFx = StartParticleFxLoopedOnEntity("ent_amb_steam", propObject, 0.0, 0.0, 0.145, 40.0, 91.0277, 0.0,
		0.5, false, false, false)
	SetParticleFxNonLoopedColour(particleColor.R, particleColor.G, particleColor.B)
	SetParticleFxNonLoopedAlpha(1.0)
	Wait(4000)
	SetModelAsNoLongerNeeded(propModel)
	DeleteObject(propObject)
	StopParticleFxLooped(particleFx, 0)
	ClearPedTasks(cache.ped)
end

function HatHair(args)
	local player = cache.ped
	if #args == 0 then
		if OriginalHair == 0 then
			local hair = GetPedDrawableVariation(PlayerPedId(), 2)
			SetResourceKvpInt("bostra-hairstyle:originalHair", hair)
		end
		if OriginalHair then
			SetPlayerHair(player, OriginalHair)
			SendNotify("Hair set to the original style.", "success")
		else
			SendNotify("You have not styled your hair yet.", "error")
		end
	elseif #args == 1 then
		local styleNumber = tonumber(args[1])
		local isMale = IsPlayerMale(player)
		local stylesConfig = isMale and Config.Male or Config.Female
		if stylesConfig["Hair" .. styleNumber] then
			local newStyle = stylesConfig["Hair" .. styleNumber].Drawable
			SetPlayerHair(player, newStyle)
			SendNotify("Hair set to " .. stylesConfig["Hair" .. styleNumber].Title .. ".", "success")
		else
			SendNotify("Invalid hair style.", "error")
		end
	end
end

exports("HatHair", HatHair)

function CreateHairMenu(_, isMale)
	local hairStylesConfig = isMale and Config.Male or Config.Female
	local menuOptions = {}

	local restyleOption = {
		title = "Restyle Hair",
		description = "Reset your hair to the original style.",
		icon = "fas fa-cut",
		onSelect = function()
			StartScene()
			HatHair({})
		end,
	}
	menuOptions[#menuOptions] = restyleOption

	local sortedStyles = {}
	for _, style in pairs(hairStylesConfig) do
		sortedStyles[#sortedStyles + 1] = style
	end
	table.sort(sortedStyles, function(a, b)
		return a.Position < b.Position
	end)

	for _, style in ipairs(sortedStyles) do
		local hairOption = {
			title = style.Title,
			description = style.Description,
			icon = "fas fa-cut",
			onSelect = function()
				StartScene()
				HatHair({ tostring(style.Position) })
				ClearPedTasks(cache.ped)
			end,
		}
		menuOptions[#menuOptions + 1] = hairOption
	end

	lib.registerContext({
		id = isMale and "male_hair_menu" or "female_hair_menu",
		title = "Hairspray Styling",
		options = menuOptions,
	})
end

RegisterNetEvent("bostra-hairstyle:client:openMenu")
AddEventHandler("bostra-hairstyle:client:openMenu", function()
	CreateHairMenu(cache.ped, IsPlayerMale(cache.ped))
	local menuId = IsPlayerMale(cache.ped) and "male_hair_menu" or "female_hair_menu"
	lib.showContext(menuId)
end)

if Config.Command then
	RegisterCommand("hathair", function(source, args)
		HatHair(args)
	end, false)
end

AddEventHandler("onResourceStop", function(resource)
	local player = cache.ped
	if resource == GetCurrentResourceName() then
		if OriginalHair then
			SetPlayerHair(player, OriginalHair)
		end
	end
end)
