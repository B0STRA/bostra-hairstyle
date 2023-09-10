if Config.QB then
	QBCore = exports["qb-core"]:GetCoreObject()
end

OriginalHairStyle = {}

function SendNotify(message, type)
	if Config.Notify == false or Config.Notify == nil then
		return
	end
	if Config.Notify == "QB" or Config.Notify == "qb" then
		QBCore.Functions.Notify(message, type)
	elseif Config.Notify == "OX" or Config.Notify == "ox" then
		lib.notify({ title = "Hair Styling", description = message, type = type })
	end
end

function IsPlayerMale(player)
	return GetEntityModel(player) == `mp_m_freemode_01`
end

function SetPlayerHair(player, newStyle)
	SetPedComponentVariation(player, 2,
		GetPedDrawableVariation(player, 2) == newStyle and OriginalHairStyle[player] or newStyle, 0, 0)
end

function StartScene()
    local propModel = Config.PropName
    lib.requestModel(propModel)
    lib.requestAnimDict("switch@franklin@lamar_tagging_wall")
    lib.requestAnimDict("random@kidnap_girl") 
    lib.requestNamedPtfxAsset("core")
    local particleColor = { R = 255, G = 255, B = 255 }
    UseParticleFxAssetNextCall("core")
    local propObject = CreateObject(propModel, 0, 0, 0, true, true, true)
    AttachEntityToEntity(propObject, PlayerPedId(), 71, 0.108244000122, -0.025791563607893, -0.036832240932658,
        -56.874661452405,
        62.478464465016, -4.3258342327393, true, true, false, true, 1, true)
    TaskPlayAnim(PlayerPedId(), "switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", 8.0, 8.0, -1, 1, 0, false, false, false)
    Wait(5000)
    TaskPlayAnim(PlayerPedId(), "random@kidnap_girl", "ig_1_girl_on_phone_loop", 8.0, 8.0, -1, 1, 0, true, false, false)
    local particleFx = StartParticleFxLoopedOnEntity("ent_amb_steam", propObject, 0.0, 0.0, 0.145, 40.0, 91.0277, 0.0, 1.0,
        false, false, false)
    SetParticleFxNonLoopedColour(particleFx, particleColor.R, particleColor.G, particleColor.B, false)
    SetParticleFxNonLoopedAlpha(particleFx, 1.0)
    Wait(5000)
    DeleteObject(propObject)
    StopParticleFxLooped(particleFx, 0)
    ClearPedTasks(PlayerPedId())
end

function HatHair(arguments)
	local player = PlayerPedId()
	if not OriginalHairStyle[player] then
		OriginalHairStyle[player] = GetPedDrawableVariation(player, 2)
	end
	if #arguments == 0 then
		if OriginalHairStyle[player] then
			SetPlayerHair(player, OriginalHairStyle[player])
			SendNotify("Hair set to original style.", "success")
		else
			SendNotify("You have not styled your hair yet.", "error")
		end
	elseif #arguments == 1 then
		local styleNumber = tonumber(arguments[1])
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
	table.insert(menuOptions, {
		title = "Restyle Hair",
		description = "Reset your hair to the original style.",
		icon = "fas fa-cut",
		onSelect = function()
			StartScene()
			HatHair({})
		end,
	})
	for _, style in pairs(hairStylesConfig) do
		table.insert(menuOptions, {
			title = style.Title,
			description = style.Description,
			icon = "fas fa-cut",
			onSelect = function()
				StartScene()
				HatHair({ tostring(style.Position) })
				ClearPedTasks(PlayerPedId())
			end,
		})
	end
	lib.registerContext({
		id = isMale and "male_hair_menu" or "female_hair_menu",
		title = "Hairspray Styling",
		options = menuOptions,
	})
end

RegisterNetEvent("bostra-hairstyle:client:openMenu")
AddEventHandler("bostra-hairstyle:client:openMenu", function()
	CreateHairMenu(PlayerPedId(), IsPlayerMale(PlayerPedId()))
	local menuId = IsPlayerMale(PlayerPedId()) and "male_hair_menu" or "female_hair_menu"
	lib.showContext(menuId)
end)
if Config.Command then
	RegisterCommand("hathair", function(source, arguments)
		HatHair(arguments)
	end, false)
end
AddEventHandler("onResourceStop", function(resource)
	local player = PlayerPedId()
	if resource == GetCurrentResourceName() then
		if OriginalHairStyle[player] then
			SetPlayerHair(player, OriginalHairStyle[player])
		end
	end
end)
