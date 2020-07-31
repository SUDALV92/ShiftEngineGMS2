/// @description  initialize_game( slotIndex )
/// @param  slotIndex 

var slotIndex = argument0;

with( oWorld ) {
    instance_destroy();
}

global.LastSaveIndex = slotIndex;
save_metadata();

var world = instance_create_depth( 0, 0, 1000000000, oWorld );
world.SaveIndex = slotIndex;
world.SaveData = get_save_data( slotIndex );

// Load deathtime.
world.DeathCount = world.SaveData[? "engine.death"];
world.TimeSeconds = world.SaveData[? "engine.time"];
update_title();

// Start the loaded game.
if( !restart_game() ) {
    delete_save_data( slotIndex );
    initialize_game( slotIndex );
}
