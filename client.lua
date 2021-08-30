local PlayerData = {}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function ()
	-- Create blip --
	local blip = AddBlipForCoord(Config.Marker.x, Config.Marker.y, Config.Marker.z)

	SetBlipSprite (blip, 407)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 1.2)
	SetBlipColour (blip, 27)
	SetBlipAsShortRange(blip, true)
	
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Munkaügyi iroda")
	EndTextCommandSetBlipName(blip)

	while true do
		Citizen.Wait(0)
		DrawMarker(Config.Marker.type, Config.Marker.x, Config.Marker.y, Config.Marker.z, 0, 0, 0, 0, 0, 0, 2.0001,2.0001,2.0001, 0, Config.Color.r, Config.Color.g, Config.Color.b, 0, 0, 0, 0, 0, 0, 0)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -267.92422485352,-957.95263671875,31.22313117981, true) < 1 then
			DisplayHelpText("Nyomj ~INPUT_PICKUP~, hogy megtekintsd az álláslehetöségeket")
		 if (IsControlJustReleased(1, 51)) then
			ESX.TriggerServerCallback('esx_jk_jobs:getJobs', function(s_jobs)
				SetNuiFocus( true, true )
				SendNUIMessage({
					active = true,
					jobs = s_jobs
				})
			end)
		 end
		end
	end
end)


RegisterNUICallback('closeMenu', function(data, cb)
	SetNuiFocus( false )
	SendNUIMessage({
	active = false
	})
  	cb('ok')
end)

RegisterNUICallback('registerJob', function(data, cb)
	SetNuiFocus(false)
	SendNUIMessage({
		active = false
	})
	TriggerServerEvent('esx_jk_jobs:setJob', data)
	cb('ok')
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
