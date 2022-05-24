fx_version 'cerulean'
game 'gta5'

name "zByte ClipBoard"
description "Copy To ClipBoard"
author "zByte Team [ !^Parzival#4532 | Nimaism#4092 ]"
version "1.0.0"

client_scripts {
	'Client/Client.lua'
}

files {
    'Ui/index.html'
}

export 'SettingClipboard'

export 'SetClipboard'

ui_page('Ui/index.html')