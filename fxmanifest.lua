fx_version 'cerulean'
game 'gta5'

author "qbcore-framework"
description 'QB-Customs'
version '1.0.0'


files {
    "./html/style.css",
    "./html/index.js",
    "./html/index.html"
}

ui_page "./html/index.html"

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    "client/main.lua"
}

server_script "server/main.lua"

shared_scripts {
    "shared/*.lua"
}

lua54 "yes"
