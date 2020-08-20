/// @description  spawner_create( x, y, spawnPeriod, spawnObject, spawnDuration = undefined )
/// @param  x
/// @param  y
/// @param  layer
/// @param  spawnPeriod
/// @param  spawnObject
/// @param  spawnDuration = undefined 
function spawner_create() {

	// Create a mechanism that creates an instance of spawnObject at (x, y)
	// The instance is created every spawnPeriod frames.
	// A non-integer can be passed as spawnPeriod, in this case the spawning will be 
	// averaged across frames to match the spawn period as closely as poosible.
	// Duration can be specified. By default the spawner exists until explicitly destroyed.
	// The spawner instance is returned.

	var spawnX = argument[0];
	var spawnY = argument[1];
	var spawnLayer = argument[2];
	var spawnPeriod = argument[3];
	var spawnObject = argument[4];
	var spawnDuration = undefined;
	if( argument_count > 5 ) {
	    spawnDuration = argument[5];
	}

	var spawner = instance_create_layer( spawnX, spawnY, spawnLayer, oFixedSpawner );
	spawner.Period = spawnPeriod;
	spawner.CurrentPhase = 1;
	spawner.SpawnObject = spawnObject;
	spawner.Duration = spawnDuration;
	return spawner;





}
