/// @description  circle_create_layer( spawnX, spawnY, layer, spawnAngle, spawnNum, spawnObj, opt_circleParams )
/// @param  spawnX
/// @param  spawnY
/// @param  layer
/// @param  spawnAngle
/// @param  spawnNum
/// @param  spawnObj
/// @param  opt_circleParams 
// Spawn a ring of entities.
// spawnX - center X
// spawnY - center Y
// spawnAngle - starting angle
// spawnNum - number of entities to spawn
// spawnObj - entity object to spawn
// (optional) circleParams - instance id with arbitrary circle parameters. This argument will be attached to every entity as a "Circle" field.

var spawnX = argument[0];
var spawnY = argument[1];
var layerID = argument[2];
var spawnAngle = argument[3];
var spawnNum = argument[4];
var spawnObj = argument[5];

var circle;
if( argument_count > 6 ) {
    circle = argument[6];
} else {
    circle = circle_params_create();
}

if( circle.Shift_EntityCount != 0 ) {
    show_error( "Same circle parameters cannot be used for multiple circles.", true );
}

circle.x = spawnX;
circle.y = spawnY;
circle.Shift_EntityCount = spawnNum;
for( var i = 0; i < spawnNum; i++ ) {
    var entity = instance_create_layer( spawnX, spawnY, layerID, oSpawnDummy );
    entity.direction = spawnAngle + i * ( 360 / spawnNum );
    entity.StartDirection = entity.direction;
    entity.Circle = circle;
    with( entity ) {
        instance_change( spawnObj, true );
    }
    circle.Shift_Entities[i] = entity;
}
return circle;
