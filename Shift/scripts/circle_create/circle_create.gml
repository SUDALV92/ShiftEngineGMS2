// Spawn a ring of entities.
// spawnX - center X
// spawnY - center Y
// layer - spawning layer
// spawnAngle - starting angle
// spawnNum - number of entities to spawn
// spawnObj - entity object to spawn
// (optional) circleParams - instance id with arbitrary circle parameters. This argument will be attached to every entity as a "Circle" field.
function circle_create(spawnX, spawnY, spawnLayer, spawnAngle, spawnNum, spawnObj, circleParams = circle_params_create())
{
	var circle = circleParams;
	
	if( circle.Shift_EntityCount != 0 ) {
	    show_error( "Same circle parameters cannot be used for multiple circles.", true );
	}

	circle.x = spawnX;
	circle.y = spawnY;
	circle.Shift_EntityCount = spawnNum;
	for( var i = 0; i < spawnNum; i++ ) {
	    var entity = instance_create_layer( spawnX, spawnY, spawnLayer, oSpawnDummy );
	    entity.direction = spawnAngle + i * ( 360 / spawnNum );
	    entity.StartDirection = entity.direction;
	    entity.Circle = circle;
	    with( entity ) {
	        instance_change( spawnObj, true );
	    }
	    circle.Shift_Entities[i] = entity;
	}
	return circle;
}
