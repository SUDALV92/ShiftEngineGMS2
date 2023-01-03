// Create a mechanism that creates an instance of spawnObject at (x, y)
// The instance is created every spawnPeriod frames.
// A non-integer can be passed as spawnPeriod, in this case the spawning will be 
// averaged across frames to match the spawn period as closely as poosible.
// Duration can be specified. By default the spawner exists until explicitly destroyed.
// The spawner instance is returned.
function spawner_create(spawnX, spawnY, spawnLayer, spawnPeriod, spawnObject, spawnDuration = undefined) 
{
	var spawner = instance_create_layer( spawnX, spawnY, spawnLayer, oFixedSpawner );
	spawner.Period = spawnPeriod;
	spawner.CurrentPhase = 1;
	spawner.SpawnObject = spawnObject;
	spawner.Duration = spawnDuration;
	return spawner;
}
