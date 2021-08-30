local jobs = {}

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_jk_jobs:setJobt')
AddEventHandler('esx_jk_jobs:setJobt', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("taxi", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'You were hired ~g~' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobm')
AddEventHandler('esx_jk_jobs:setJobm', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("mechanic", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'You were hired ~g~' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobp')
AddEventHandler('esx_jk_jobs:setJobp', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("fisherman", 0)-- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'You were hired ~g~' .. xPlayer.getName())
end)

RegisterServerEvent('esx_jk_jobs:setJobn')
AddEventHandler('esx_jk_jobs:setJobn', function(job)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.setJob("miner", 0) -- 0 is job grade
	TriggerClientEvent('esx:showNotification', source, 'You were hired ~g~' .. xPlayer.getName())	
end)

RegisterServerEvent('esx_jk_jobs:setJob')
AddEventHandler('esx_jk_jobs:setJob', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.setJob(job, 0)
	xPlayer.showNotification("Sikeresen felvettek az általad ~g~kiválasztott ~w~munkára!", false, yes, 60)
end)

ESX.RegisterServerCallback('esx_jk_jobs:getJobs', function(source, cb)
	if #jobs == 0 then
		MySQL.Async.fetchAll('SELECT * FROM jobs WHERE whitelisted = @whitelisted', {
			['@whitelisted'] = 0
		}, function(data)
			for _,v in pairs(data) do
				print(v.name .. v.label .. v.icon)
				table.insert(jobs, {name = v.name, label = v.label, icon = v.icon})
			end
			cb(jobs)
		end)
	else cb(jobs)
	end
end)