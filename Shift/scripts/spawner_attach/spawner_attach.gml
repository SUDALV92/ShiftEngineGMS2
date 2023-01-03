// Create a mechanism that creates an instance of spawnObject.
// The spawner is attached to a given instance or to all instances of a given object.
// The spawnObject is created every spawnPeriod frames.
// A non-integer can be passed as spawnPeriod, in this case the spawning will be 
// averaged across frames to match the spawn period as closely as poosible.
// Duration in frames can be specified. By default the spawner exists until the spawner or its parent are explicitly destroyed.
// The spawner instance is returned if it was attached to a single instance. 
// Otherwise undefined is returned.
// An Spawner field is created in the owner instance that references the spawner instance.
function spawner_attach(ownerId, spawnPeriod, spawnObject, spawnDuration = undefined)
{
	var resultSpawner = noone;
	with( ownerId ) {
	    var spawner = instance_create_depth( x, y, depth, oAttachedSpawner );
	    spawner.OwnerInstance = id;
	    spawner.Period = spawnPeriod;
	    spawner.CurrentPhase = 1;
	    spawner.SpawnObject = spawnObject;
	    spawner.Duration = spawnDuration;
	    Spawner = spawner;
	    Executor = spawner;
	    if( resultSpawner == noone ) {
	        resultSpawner = spawner;
	    } else {
	        resultSpawner = undefined;
	    }
	}
	return resultSpawner;
}
