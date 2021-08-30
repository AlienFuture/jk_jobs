local jobs = {}

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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
