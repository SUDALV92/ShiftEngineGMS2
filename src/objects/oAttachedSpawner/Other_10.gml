// Create a dummy object first to provide the Spawner field to the create event.
var newInstance = instance_create_depth( x, y, depth, oSpawnDummy );
newInstance.Spawner = id;
newInstance.Executor = id;
with( newInstance ) {
    instance_change( other.SpawnObject, true );
}

