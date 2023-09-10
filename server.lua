if Config.QB and Config.Items then
QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end
	TriggerClientEvent('bostra-hairstyle:client:openMenu', source)
end)
elseif Config.Items then
	ESX.RegisterUsableItem(Config.ItemName, function(source)
		local Player = ESX.GetPlayerFromId(source)
		if not Player.getInventoryItem(Config.ItemName) then return end
		TriggerClientEvent('bostra-hairstyle:client:openMenu', source)
	end)
end