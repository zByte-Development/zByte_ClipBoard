local CALLBACK = nil
local SETTING_CLIPBOARD = false

function SettingClipboard()
	return SETTING_CLIPBOARD
end

function SetClipboard(text, cb)
	SETTING_CLIPBOARD = true
	CALLBACK = cb
	SetNuiFocus(true, false)
	SendNUIMessage({
		type = 'SET_CLIPBOARD',
		payload = text,
		meta = 1
	})
end

RegisterNUICallback('message', function (data, cb)
	cb("done")

	if data == nil then return

	elseif data.type == 'SETTING_CLIPBOARD' then
		SETTING_CLIPBOARD = true

	elseif data.type == 'SET_CLIPBOARD' then
		SETTING_CLIPBOARD = false

		if (CALLBACK) then
			CALLBACK(not data.payload)
			CALLBACK = nil
		end
		SetTimeout(17, function ()
			SetNuiFocus(false, false)
		end)
	end
end)

exports('SetClipboard', SetClipboard)


