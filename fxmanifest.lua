fx_version 'cerulean'
description 'Basic script for adjusting hair for hats or styling hair on the go.'
author 'Bostra'
version '1.0.0'
repository 'https://github.com/b0stra/bostra-hairstyle'
lua54 'yes'

games {"gta5"}

client_scripts {"client.lua"}

files {
    "stream/*.*",
}

shared_scripts { "config.lua", "@ox_lib/init.lua" }

server_scripts {"server.lua"}
data_file 'DLC_ITYP_REQUEST' 'stream/bostra_hairspray.ytyp'