# Bostra-Hairstyle

![bostra-hairstyle](https://github.com/B0STRA/bostra-hairstyle/assets/119994243/bd419e7b-59c9-4ab1-9ceb-627c3885946b)


**Features:**

* Fully Open-Source
* Customizable
* Easy to configure
* Simple resource with 0.0ms resmon idle, up to 0.02 when starting ptfx. 
* Standalone Framework-wise as there's no framework dependencies if not using item or QB notify. QB/ESX item setup, I don't use esx so test or pr at your will. 
* Command or Item use.
* Custom prop. 


# [Preview-Video](https://streamable.com/jxw9fn)



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


# Dependencies
[ox_lib](https://github.com/overextended/ox_lib)


 <h1>Support</h1>
<u1>

[Bostra-Development Discord](https://dsc.gg/bostra)

</u1>

<u1>

[md-scripts Discord](https://discord.gg/RVx8nVwcEG)

</u1>
