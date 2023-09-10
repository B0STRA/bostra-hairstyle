if Config.QB and Config.Items then
QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
	TriggerClientEvent('bostra-hairstyle:client:openMenu', source)
end)
elseif Config.Items then
	ESX = exports["es_extended"]:getSharedObject()
	ESX.RegisterUsableItem(Config.ItemName, function(source)
		TriggerClientEvent("bostra-hairstyle:client:openMenu", source)
	end)
end
