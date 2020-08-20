/// @description  initialize_game( slotIndex )
/// @param  slotIndex 
function initialize_game(argument0) {

	var slotIndex = argument0;

	with( oWorld ) {
	    instance_destroy();
	}

	global.LastSaveIndex = slotIndex;
	save_metadata();

	var world = instance_create_depth( 0, 0, 0, oWorld );
	world.SaveIndex = slotIndex;
	world.SaveData = get_save_data( slotIndex );

	// Load deathtime.
	world.DeathCount = world.SaveData[? "engine.death"];
	world.TimeSeconds = world.SaveData[? "engine.time"];
	update_title();

	// Start the loaded game.
	if( !game_reload_world() ) {
	    delete_save_data( slotIndex );
	    initialize_game( slotIndex );
	}



}
