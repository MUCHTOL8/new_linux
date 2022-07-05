#screeps-api-info
`-`
> Screeps API documentation for programming.
`-`

GLOBAL OBJECTS
`	Game`
`	InterShardMemory`
`	Game.map`
`	Game.map.visual`
`	Game.market`
`	Memory`
`	PathFinder`
`	Rawmemory`
`	Constants (a list of constants)`

- Game

`The main global game object containing all the game play information.`

- InterShardMemory

`Object provides an interface for communicating between shards. Your script is executed separatedly on each shard, and their Memory objects are isolated from each other. In order to pass messages and data between shards, you need to use InterShardMemory instead.`
`Every shard can have its own 100 KB of data in string format that can be accessed by all other shards. A shard can write only to its own data, other shards' data is read-only.`
`This data has nothing to do with Memory contents, it's a separate data container.`

- Game.map

`A global object representing world map. Use it to navigate between rooms.`

- Game.map.visual

`Map visuals provide a way to show various visual debug info on the game map. You can use the Game.map.visual object to draw simple shapes that are visible only to you.`
`Map visuals are not stored in the database, their only purpose is to display something in your browser. All drawings will persist for one tick and will disappear if not updated. All Game.map.visual calls have no added CPU cost (their cost is natural and mostly related to simple JSON.serialize calls). However, there is a usage limit: you cannot post more than 1000 KB of serialized data.`
`All draw coordinates are measured in global game coordinates (RoomPosition).`

- Game.market

`A global object representing the in-game market. You can use this object to track resource transactions to/from your terminals, and your buy/sell orders.`
`Learn more about the market system from this article.`

- PathFinder

`Contains powerful methods for pathfinding in the game world. This module is written in fast native C++ code and supports custom navigation costs and paths which span multiple rooms.`

- RawMemory

`RawMemory object allows to implement your own memory stringifier instead of built-in serializer based on JSON.stringify. It also allows to request up to 10 MB of additional memory using asynchronous memory segments feature.`
`You can also access memory segments of other players using methods below.`

- Constants

`All the following constant names are available in the global scope:`
`You can find the list at: tldr screeps-constants-info`
`-`
PROTOTYPES
`	ConstructionSite`
`	Creep`
`	Deposit`
`	Flag`
`	Mineral`
`	Nuke`
`	OwnedStructure`
`	PathFinder.CostMatrix`
`	PowerCreep`
`	Resource`
`	Room`
`	Room.Terrain`
`	RoomObject`
`	RoomPosition`
`	RoomVisual`
`	Ruin`
`	Source`
`	Store`
`	Structure`
`	StructureContainer`
`	StructureController`
`	StructureExtension`
`	StructureExtractor`
`	StructureFactory`
`	StructureInvaderCore`
`	StructureKeeperLair`
`	StructureLab`
`	StructureLink`
`	StructureNuker`
`	StructureObserver`
`	StructurePowerBank`
`	StructurePowerSpawn`
`	StructurePortal`
`	StructureRampart`
`	StructureRoad`
`	StructureSpawn`
`	StructureSpawn.Spawning`
`	StructureStorage`
`	StructureTerminal`
`	StructureTower`
`	StructureWall`
`	TombStone`

- ConstructionSite

`A site of a structure which is currently under construction. A construction site can be created using the 'Construct' button at the left of the game field or the Room.createConstructionSite method.`
`To build a structure on the construction site, give a worker creep some amount of energy and perform Creep.build action.`
`You can remove enemy construction sites by moving a creep on it.`

- Creep

`Creeps are your units. Creeps can move, harvest energy, construct structures, attack another creeps, and perform other actions. Each creep consists of up to 50 body parts with the following possible types:`
`Body part 	Build cost 	Effect per one body part`
`MOVE 		50 		Decreases fatigue by 2 points per tick.`
`WORK 		100 		Harvests 2 energy units from a source per tick.`
`				Harvests 1 resource unit from a mineral or a deposit per tick.`
`				Builds a structure for 5 energy units per tick.`
`				Repairs a structure for 100 hits per tick consuming 1 energy unit per tick.`
`				Dismantles a structure for 50 hits per tick returning 0.25 energy unit per tick.`
`				Upgrades a controller for 1 energy unit per tick.`
`CARRY 		50 		Can contain up to 50 resource units.`
`ATTACK 	80 		Attacks another creep/structure with 30 hits per tick in a short-ranged attack.`
`RANGED_ATTACK 	150 		Attacks another single creep/structure with 10 hits per tick in a long-range attack up to 3 squares long.`
`Attacks all hostile creeps/structures within 3 squares range with 1-4-10 hits (depending on the range).`
`HEAL 		250 		Heals self or another creep restoring 12 hits per tick in short range or 4 hits per tick at a distance.`
`CLAIM 		600 		Claims a neutral room controller.`
`				Reserves a neutral room controller for 1 tick per body part.`
`				Attacks a hostile room controller downgrading its timer by 300 ticks per body parts.`
`				Attacks a neutral room controller reservation timer by 1 tick per body parts.`
`				A creep with this body part will have a reduced life time of 600 ticks and cannot be renewed.`
`TOUGH	 	10 		No effect, just additional hit points to the creep's body. Can be boosted to resist damage.`

- Deposit 

`A rare resource deposit needed for producing commodities. Can be harvested by creeps with a WORK body part. Each harvest operation triggers a cooldown period, which becomes longer and longer over time.`
`Learn more about deposits from this article. `
`Cooldown 	0.001 * totalHarvested ^ 1.2`
`Decay 	50,000 ticks after appearing or last harvest operation`

- Flag

`A flag. Flags can be used to mark particular spots in a room. Flags are visible to their owners only. You cannot have more than 10,000 flags.`

- Mineral

`A mineral deposit. Can be harvested by creeps with a WORK body part using the extractor structure. Learn more about minerals from this article.`
`Regeneration amount 	DENSITY_LOW: 15,000`
`			DENSITY_MODERATE: 35,000`
`			DENSITY_HIGH: 70,000`
`			DENSITY_ULTRA: 100,000`

- Nuke

`A nuke landing position. This object cannot be removed or modified. You can find incoming nukes in the room using the FIND_NUKES constant.`
`Landing time 	50,000 ticks`
`Effect 	All creeps, construction sites and dropped resources in the room are removed immediately, even inside ramparts. Damage to structures:`
`		10,000,000 hits at the landing position;`
`		5,000,000 hits to all structures in 5x5 area.`
`		Note that you can stack multiple nukes from different rooms at the same target position to increase damage.`

`		Nuke landing does not generate tombstones and ruins, and destroys all existing tombstones and ruins in the room`

`		If the room is in safe mode, then the safe mode is cancelled immediately, and the safe mode cooldown is reset to 0.`

`		The room controller is hit by triggering upgradeBlocked period, which means it is unavailable to activate safe mode again within the next 200 ticks.`

- OwnedStructure

`The base prototype for a structure that has an owner. Such structures can be found using FIND_MY_STRUCTURES and FIND_HOSTILE_STRUCTURES constants.`

- PathFinder.CostMatrix

`Container for custom navigation cost data. By default PathFinder will only consider terrain data (plain, swamp, wall) — if you need to route around obstacles such as buildings or creeps you must put them into a CostMatrix. Generally you will create your CostMatrix from within roomCallback. If a non-0 value is found in a room's CostMatrix then that value will be used instead of the default terrain cost. You should avoid using large values in your CostMatrix and terrain cost flags. For example, running PathFinder.search with { plainCost: 1, swampCost: 5 } is faster than running it with {plainCost: 2, swampCost: 10 } even though your paths will be the same.`

- PowerCreep

`Power Creeps are immortal "heroes" that are tied to your account and can be respawned in any PowerSpawn after death. You can upgrade their abilities ("powers") up to your account Global Power Level (see Game.gpl).`
`Time to live 	5,000`
`Hits 		1,000 per level`
`Capacity 	100 per level`
`Full list of available powers in a list.`

- Resource

`A dropped piece of resource. It will decay after a while if not picked up. Dropped resource pile decays for ceil(amount/1000) units per tick. `

- Room

`An object representing the room in which your units and structures are in. It can be used to look around, find paths, etc. Every RoomObject in the room contains its linked Room instance in the room property.`

- Room.Terrain

`An object which provides fast access to room terrain data. These objects can be constructed for any room in the world even if you have no access to it.`

`Technically every Room.Terrain object is a very lightweight adapter to underlying static terrain buffers with corresponding minimal accessors.`

- RoomObject

`Any object with a position in a room. Almost all game objects prototypes are derived from RoomObject.`

- RoomPosition

`An object representing the specified position in the room. Every RoomObject in the room contains RoomPosition as the pos property. The position object of a custom location can be obtained using the Room.getPositionAt method or using the constructor.`

- RoomVisual

`Room visuals provide a way to show various visual debug info in game rooms. You can use the RoomVisual object to draw simple shapes that are visible only to you. Every existing Room object already contains the visual property, but you also can create new RoomVisual objects for any room (even without visibility) using the constructor.`

`Room visuals are not stored in the database, their only purpose is to display something in your browser. All drawings will persist for one tick and will disappear if not updated. All RoomVisual API calls have no added CPU cost (their cost is natural and mostly related to simple JSON.serialize calls). However, there is a usage limit: you cannot post more than 500 KB of serialized data per one room (see getSize method).`

`All draw coordinates are measured in game coordinates and centered to tile centers, i.e. (10,10) will point to the center of the creep at x:10; y:10 position. Fractional coordinates are allowed.`

- Ruin

`A destroyed structure. This is a walkable object.`
`Decay 		500 ticks except some special cases`

- Source

`An energy source object. Can be harvested by creeps with a WORK body part.`
`Energy amount 		4000 in center rooms`
`			3000 in an owned or reserved room`
`			1500 in an unreserved room`
`Energy regeneration 	Every 300 game ticks`

- Store

`An object that can contain resources in its cargo.`

`There are two types of stores in the game: general purpose stores and limited stores.`

`    General purpose stores can contain any resource within its capacity (e.g. creeps, containers, storages, terminals).`

`    Limited stores can contain only a few types of resources needed for that particular object (e.g. spawns, extensions, labs, nukers).`

`The Store prototype is the same for both types of stores, but they have different behavior depending on the resource argument in its methods.`

`You can get specific resources from the store by addressing them as object properties:`

`console.log(creep.store[RESOURCE_ENERGY]);`

- Structure

`The base prototype object of all structures.`

- StructureContainer

`A small container that can be used to store resources. This is a walkable structure. All dropped resources automatically goes to the container at the same tile.`
`Controller level 	Any (including neutral rooms)`
`Available per room 	5`
`Capacity 		2,000`
`Cost 			5,000`
`Hits 			250,000`
`Decay 			Loses 5,000 hits every 500 ticks in an owned room, and every 100 ticks in an unowned room.`

- StructureController

`Claim this structure to take control over the room. The controller structure cannot be damaged or destroyed.`

`It can be addressed by Room.controller property.`
`Level 	Upgrade to next level 	Downgrade timer`
`1 	200 energy 		20,000 ticks`
`2 	45,000 energy 		10,000 ticks`
`3 	135,000 energy 		20,000 ticks`
`4 	405,000 energy 		40,000 ticks`
`5 	1,215,000 energy 	80,000 ticks`
`6 	3,645,000 energy 	120,000 ticks`
`7 	10,935,000 energy 	150,000 ticks`
`8 	— 			200,000 ticks`
`Safe mode`
`Effect 	Blocks attack, rangedAttack, rangedMassAttack, dismantle, heal, rangedHeal, attackController, and withdraw methods of all hostile creeps in the room, plus enableRoom and usePower methods of hostile Power Creeps. Only one room can be in safe mode at the same time.`
`When safe mode is active, all hostile creeps become visually transparent and passable - your creeps can move through them freely (but not vice versa).`
`Duration 	20,000 ticks`
`Cooldown 	50,000 ticks (no cooldown in Novice Areas, also no cooldown for initial Safe Mode in your first room)`
`Generation` 	

`    Each new controller level generates one available activation`
`    Can be generated by creeps using 1,000 ghodium`
`    All available activations are reset if the controller is downgraded`

- StructureExtension

`Contains energy which can be spent on spawning bigger creeps. Extensions can be placed anywhere in the room, any spawns will be able to use them regardless of distance.`
`Controller level`
`1 	—`
`2 	5 extensions (50 capacity)`
`3 	10 extensions (50 capacity)`
`4 	20 extensions (50 capacity)`
`5 	30 extensions (50 capacity)`
`6 	40 extensions (50 capacity)`
`7 	50 extensions (100 capacity)`
`8 	60 extensions (200 capacity)`
`Cost 	3,000`
`Hits 	1,000`

- StructureExtractor

`Allows to harvest a mineral deposit. Learn more about minerals from this article.

`Controller level 	6`
`Cost 			5,000`
`Hits 			500`
`Cooldown 		5 ticks on each harvest action`

- StructureFactory

`Produces trade commodities from base minerals and other commodities. Learn more about commodities from this article.`
`Controller level`
`1-6 			—`
`7-8 			1 factory`
`Cost 			100,000`
`Hits 			1000`
`Capacity 		50,000`
`Production cooldown 	Depends on the resource`

- StructureInvaderCore

`This NPC structure is a control center of NPC Strongholds, and also rules all invaders in the sector. It spawns NPC defenders of the stronghold, refill towers, repairs structures. While it's alive, it will spawn invaders in all rooms in the same sector. It also contains some valuable resources inside, which you can loot from its ruin if you destroy the structure.`

`An Invader Core has two lifetime stages: deploy stage and active stage. When it appears in a random room in the sector, it has ticksToDeploy property, public ramparts around it, and doesn't perform any actions. While in this stage it's invulnerable to attacks (has EFFECT_INVULNERABILITY enabled). When the ticksToDeploy timer is over, it spawns structures around it and starts spawning creeps, becomes vulnerable, and receives EFFECT_COLLAPSE_TIMER which will remove the stronghold when this timer is over.`

`An active Invader Core spawns level-0 Invader Cores in neutral neighbor rooms inside the sector. These lesser Invader Cores are spawned near the room controller and don't perform any activity except reserving/attacking the controller. One Invader Core can spawn up to 42 lesser Cores during its lifetime.`
`Hits 				100,000`
`Deploy time 			5,000 ticks`
`Active time 			75,000 ticks with 10% random variation`
`Lesser cores spawn interval:`
`Stronghold level 1: 		4000 ticks`
`Stronghold level 2: 		3500 ticks`
`Stronghold level 3: 		3000 ticks`
`Stronghold level 4: 		2500 ticks`
`Stronghold level 5: 		2000 ticks`

- StructureKeeperLair

`Non-player structure. Spawns NPC Source Keepers that guards energy sources and minerals in some rooms. This structure cannot be destroyed.`
`Spawning time 	300`

- StructureLab

`Produces mineral compounds from base minerals, boosts and unboosts creeps. Learn more about minerals from this article.`
`Controller level`
`1-5 				—`
`6 				3 labs`
`7 				6 labs`
`8 				10 labs`
`Cost 				50,000`
`Hits 				500`
`Capacity 			3000 mineral units, 2000 energy units`
`Produce 			5 mineral compound units per reaction`
`Reaction cooldown 		Depends on the reaction (see this article)`
`Distance to input labs 	2 squares`
`Boost cost 			30 mineral units, 20 energy units per body part`

- StructureLink

`Remotely transfers energy to another Link in the same room.`
`Controller level`
`1-4 		—`
`5 		2 links`
`6 		3 links`
`7 		4 links`
`8 		6 links`
`Cost 		5,000`
`Hits 		1,000`
`Capacity 	800`
`Cooldown time 	1 tick per tile of the linear distance to the target`
`Energy loss 	3%`

- StructureNuker

`Launches a nuke to another room dealing huge damage to the landing area. Each launch has a cooldown and requires energy and ghodium resources. Launching creates a Nuke object at the target room position which is visible to any player until it is landed. Incoming nuke cannot be moved or cancelled. Nukes cannot be launched from or to novice rooms. Resources placed into a StructureNuker cannot be withdrawn.`
`Controller level`
`1-7 			—`
`8 			1 nuke`
`Cost 			100,000`
`Hits 			1,000`
`Range 			10 rooms`
`Launch cost 		300,000 energy`
`			5,000 ghodium`
`Launch cooldown 	100,000 ticks`
`Landing time 		50,000 ticks`
`Effect		 	All creeps, construction sites and dropped resources in the room are removed immediately, even inside ramparts. Damage to structures:`

`    10,000,000 hits at the landing position;`
`    5,000,000 hits to all structures in 5x5 area.`

`Note that you can stack multiple nukes from different rooms at the same target position to increase damage.`

`Nuke landing does not generate tombstones and ruins, and destroys all existing tombstones and ruins in the room`

`If the room is in safe mode, then the safe mode is cancelled immediately, and the safe mode cooldown is reset to 0.`

`The room controller is hit by triggering upgradeBlocked period, which means it is unavailable to activate safe mode again within the next 200 ticks.`

- StructureObserver

`Provides visibility into a distant room from your script.`
`Controller level`
`1-7 	—`
`8 	1 observer`
`Cost 	8,000`
`Hits 	500`
`Range 	10 rooms`

- StructurePowerBank

`Non-player structure. Contains power resource which can be obtained by destroying the structure. Hits the attacker creep back on each attack. Learn more about power from this article.`
`Hits 		2,000,000`
`Return damage 	50%`
`Capacity 	500 — 10,000`
`Decay 		5,000 ticks`

- StructurePowerSpawn

`Processes power into your account, and spawns power creeps with special unique powers (in development). Learn more about power from this article.`
`Controller level`
`1-7 			—`
`8 			1 power spawn`
`Cost 			100,000`
`Hits 			5,000`
`Capacity 		5,000 energy units, 100 power units`
`Processing cost 	50 energy units per 1 power unit`
`Processing speed 	1 power unit per tick`

- StructurePortal

`A non-player structure. Instantly teleports your creeps to a distant room acting as a room exit tile. Portals appear randomly in the central room of each sector.`

`Stable time 	10 days`
`Decay time 	30,000 ticks`

- StructureRampart

`Blocks movement of hostile creeps, and defends your creeps and structures on the same tile. Can be used as a controllable gate.`
`Controller level`
`1 			—`
`2 			300,000 max hits`
`3 			1,000,000 max hits`
`4 			3,000,000 max hits`
`5 			10,000,000 max hits`
`6 			30,000,000 max hits`
`7 			100,000,000 max hits`
`8 			300,000,000 max hits`
`Cost 			1`
`Hits when constructed 	1`
`Decay 			Loses 300 hits every 100 ticks`

- StructureRoad

`Decreases movement cost to 1. Using roads allows creating creeps with less MOVE body parts. You can also build roads on top of natural terrain walls which are otherwise impassable.`
`Controller level 	Any (including neutral rooms)`
`Cost` 	

`    300 on plain land`
`    1,500 on swamp`
`    45,000 on walls`

`Hits`

`    5,000 on plain land`
`    25,000 on swamp`
`    750,000 on walls`

`Decay` 	

`    Loses 100 hits every 1,000 ticks on plain land`
`    Loses 500 hits every 1,000 ticks on swamp`
`    Loses 15,000 hits every 1,000 ticks on walls`

`Note: every creep step decreases the decay timer for 1 tick per each creep body part`

- StructureSpawn

`Spawn is your colony center. This structure can create, renew, and recycle creeps. All your spawns are accessible through Game.spawns hash list. Spawns auto-regenerate a little amount of energy each tick, so that you can easily recover even if all your creeps died.`
`Controller level`
`1-6 				1 spawn`
`7 				2 spawns`
`8 				3 spawns`
`Cost 				15,000`
`Hits 				5,000`
`Capacity 			300`
`Spawn time 			3 ticks per each body part`
`Energy auto-regeneration 	1 energy unit per tick while energy available in the room (in all spawns and extensions) is less than 300`

- StructureSpawn.Spawning

`Details of the creep being spawned currently that can be addressed by the StructureSpawn.spawning property.`

- StructureStorage

`A structure that can store huge amount of resource units. Only one structure per room is allowed that can be addressed by Room.storage property.`

`Controller level`
`1-3 		—`
`4-8 		1 storage`
`Cost 		30,000`
`Hits 		10,000`
`Capacity 	1,000,000`

- StructureTerminal

`Sends any resources to a Terminal in another room. The destination Terminal can belong to any player. Each transaction requires additional energy (regardless of the transfer resource type) that can be calculated using Game.market.calcTransactionCost method. For example, sending 1000 mineral units from W0N0 to W10N5 will consume 742 energy units. You can track your incoming and outgoing transactions using the Game.market object. Only one Terminal per room is allowed that can be addressed by Room.terminal property.`

`Terminals are used in the Market system.`
`Controller level`
`1-5 			—`
`6-8 			1 terminal`
`Cost 			100,000`
`Hits 			3,000`
`Capacity 		300,000`
`Cooldown on send 	10 ticks`

- StructureTower

`Remotely attacks or heals creeps, or repairs structures. Can be targeted to any object in the room. However, its effectiveness linearly depends on the distance. Each action consumes energy.`
`Controller level`
`1-2 			—`
`3-4 			1 tower`
`5-6 			2 towers`
`7 			3 towers`
`8 			6 towers`
`Cost 			5,000`
`Hits 			3,000`
`Capacity 		1,000`
`Energy per action 	10`
`Attack effectiveness 	600 hits at range ≤5 to 150 hits at range ≥20`
`Heal effectiveness 	400 hits at range ≤5 to 100 hits at range ≥20`
`Repair effectiveness 	800 hits at range ≤5 to 200 hits at range ≥20`

- StructureWall

`Blocks movement of all creeps. Players can build destructible walls in controlled rooms. Some rooms also contain indestructible walls separating novice and respawn areas from the rest of the world or dividing novice / respawn areas into smaller sections. Indestructible walls have no hits property.`
`Controller level 	2`
`Cost 			1`
`Hits when constructed 	1`
`Max hits 		300,000,000`


- TombStone

`A remnant of dead creeps. This is a walkable object.`
`Decay 		5 ticks per body part of the deceased creep`

