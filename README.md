# Bostra-Hairstyle


![bostra-hairstyle](https://github.com/B0STRA/bostra-hairstyle/assets/119994243/f6855121-cd0b-45b0-b3ce-4ff69c68fdb2)
# [Preview-Video](https://streamable.com/jxw9fn)


**Features:**

* Fully Open-Source
* Customizable
* Easy to configure
* Simple resource with 0.0ms resmon idle, up to 0.02 when starting ptfx. 
* Standalone **Framework-wise** as there's no framework dependencies if not using item or QB notify. QB/ESX item setup, I don't use esx so test or pr at your will. 
* Command or Item use.
* [Custom prop: B0STRA](https://github.com/B0STRA/bostra-hairstyle/assets/119994243/5e243dfe-9056-4640-8318-e9db90226604)
* [Custom animation: Enchanted Animations](https://discord.gg/EugSpPYh)



# How To Install
* Drag and drop `bostra-hairstyle`
* Ensure after ox_lib, and framework if using items.
* ox_inventory/data/items.lua
```lua 
	['hairspray'] = {
		label = 'Hairspray',
  		description = 'A can of hairspray to restyle your hair',
		weight = 1,
		stack = false,
		close = true,
		consume = 0,
		client = {
			event = 'bostra-hairstyle:client:openMenu'
	},}
```
* qb/lj/ps-inventory goes into qb-core/shared/items.lua
```lua
	["hairspray"] = {
		["name"] = "hairspray",
		["label"] = "Hairspray",
		["weight"] = 1000,
		["type"] = "item",
		["image"] = "hairspray.png",
		["unique"] = true,
		["useable"] = true,
		["shouldClose"] = true,
		["combinable"] = nil,
		["description"] = "A can of hairspray to restyle your hair"
	},
```

# How to Use
* Use ```/hathair (position)``` for example ```/hathair 1``` will be the Hair1 in the config.

# Credits
[Enchanted Animations - Custom Animations](https://discord.gg/y8TS2JgtYr)

# Dependencies
None if not using menus or framework reliant item use. 

[ox_lib](https://github.com/overextended/ox_lib) - if using menus

# Troubleshooting & Support
[Mustache Scripts - Discord](https://discord.gg/RVx8nVwcEG)

## Tip / Commission Me
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/A0A46AZW4)
