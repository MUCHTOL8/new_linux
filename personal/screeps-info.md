#screeps-info
`-`
> Screeps: How to guide, and reference to other documentation.
`-`
Other documentation:
tldr screeps-constants-info  # Constants you can use
tldr screeps-full-info	     # Full list of everything (all API) in one file.
tldr screeps- objects-info   # Details of all the sub-objects (member objects and member data)
tldr screeps-api-info	     #
`-`
`-------------------------------------------------------------------------`
GAME UI AND BASIC SCRIPTING SECTION
`-------------------------------------------------------------------------`
module.exports.loop = function () {
`-`
}
`-`
CONSOLE TAB
create a worker
Game.spawns['Spawn1'].spawnCreep( [WORK, CARRY, MOVE], 'Harvester1' );
`-`
You can see all the characteristics of your creep (or other objects) by utilizing the "View" action.
`-`
Hide the editor panel with Alt+Enter and select your creep with the help of the "View" action.
`--------------------------------------------------------------------------`
SCRIPT TAB
send a creep to harvest energy - in main module.
`-`
module.exports.loop = function () {
    var creep = Game.creeps['Harvester1'];
    var sources = creep.room.find(FIND_SOURCES);
    if(creep.harvest(sources[0]) == ERR_NOT_IN_RANGE) {
        creep.moveTo(sources[0]);
    }
}
`-`
`-`
To commit a script to the game so it can run, use this button or Ctrl+Enter.
`--------------------------------------------------------------------------`
SCRIPT TAB
send a creep to harvest energy - in main module.
walk back worker and transfer energy - main module.
`-`
module.exports.loop = function () {
    var creep = Game.creeps['Harvester1'];
`-`
    if(creep.store.getFreeCapacity() > 0) {
        var sources = creep.room.find(FIND_SOURCES);
        if(creep.harvest(sources[0]) == ERR_NOT_IN_RANGE) {
            creep.moveTo(sources[0]);
        }
    }
    else {
        if( creep.transfer(Game.spawns['Spawn1'], RESOURCE_ENERGY) == ERR_NOT_IN_RANGE ) {
            creep.moveTo(Game.spawns['Spawn1']);
        }
    }
}
`-------------------------------------------------------------------------`
CONSOLE TAB
create a second worker.
`-`
Game.spawns['Spawn1'].spawnCreep( [WORK, CARRY, MOVE], 'Harvester2' );
`-------------------------------------------------------------------------`
SCRIPT TAB
for loop - to control multiple wokers - main module
`-`
module.exports.loop = function () {
    for(var name in Game.creeps) {
        var creep = Game.creeps[name];
`-`
        if(creep.store.getFreeCapacity() > 0) {
            var sources = creep.room.find(FIND_SOURCES);
            if(creep.harvest(sources[0]) == ERR_NOT_IN_RANGE) {
                creep.moveTo(sources[0]);
            }
        }
        else {
            if(creep.transfer(Game.spawns['Spawn1'], RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) {
                creep.moveTo(Game.spawns['Spawn1']);
            }
        }
    }
}
`--------------------------------------------------------------------------`
SCRIPT TAB
Create a role.harvester module
`-`
Clike on "New module name..."
`--------------------------------------------------------------------------`
SCRIPT TAB
new module - for loop to control multiple workers, run function inside module.exports function - role.harvester function.
`-`
var roleHarvester = {
`-`
    /** @param {Creep} creep **/
    run: function(creep) {
	    if(creep.store.getFreeCapacity() > 0) {
            var sources = creep.room.find(FIND_SOURCES);
            if(creep.harvest(sources[0]) == ERR_NOT_IN_RANGE) {
                creep.moveTo(sources[0]);
            }
        }
        else {
            if(creep.transfer(Game.spawns['Spawn1'], RESOURCE_ENERGY) == ERR_NOT_IN_RANGE) {
                creep.moveTo(Game.spawns['Spawn1']);
            }
        }
	}
};
`-`
module.exports = roleHarvester;
`---------------------------------------------------------------------------`
SCRIPT TAB
Rewrite the main module code, leaving only the loop and a call to your new module by the method require('role.harvester') - main module
Include the role.harvester module in the main module.
`-`
var roleHarvester = require('role.harvester');
`-`
module.exports.loop = function () {
`-`
    for(var name in Game.creeps) {
        var creep = Game.creeps[name];
        roleHarvester.run(creep);
    }
}
`-`
`--------------------------------------------------------------------------`
UPGRADING CONTROL SECTION
`--------------------------------------------------------------------------`
CONSOLE TAB
create upgrader creep manually
`-`
Game.spawns['Spawn1'].spawnCreep( [WORK, CARRY, MOVE], 'Upgrader1' );
`--------------------------------------------------------------------------`
CONSOLE TAB
assign different roles to each creep by writing it into each creeps memoryusing the global object "Memory".
`-`
You can check your creeps' memory in either the creep information panel on the left or on the "Memory" tab.
`-`
Game.creeps['Harvester1'].memory.role = 'harvester';
Game.creeps['Upgrader1'].memory.role = 'upgrader';
`--------------------------------------------------------------------------`











