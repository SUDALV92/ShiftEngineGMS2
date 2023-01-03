// Spawn a ring of entities.
// spawnX - center X
// spawnY - center Y
// layer - spawning layer
// spawnAngle - starting angle
// vertexCount - number of vertices in a spawned polygon
// edgeEntityCount - number of entities spawned per edge.
// spawnSpeed - base speed of a polygon from the spawn position.
// spawnObj - entity object to spawn
// (optional) polygonParams - instance id with arbitrary shape parameters. 
//  This argument will be attached to every entity as a "Polygon" field.
function polygon_create( spawnX, spawnY, spawnLayer, spawnAngle, vertexCount, edgeEntityCount, spawnSpeed, spawnObj, polygon = polygon_params_create())
{
	if( polygon.Shift_EntityCount != 0 ) {
	    show_error( "Same polygon parameters cannot be used for multiple polygons.", true );
	}

	polygon.x = spawnX;
	polygon.y = spawnY;
	polygon.Shift_EntityCount = edgeEntityCount * vertexCount;

	var spawnAngleRad = degtorad( spawnAngle );
	var verticesX, verticesY;
	for( var i = 0; i < vertexCount; i++ ) {
	    verticesX[i] = cos( spawnAngleRad + 2 * pi * i / vertexCount );
	    verticesY[i] = sin( spawnAngleRad + 2 * pi * i / vertexCount );
	}
	verticesX[vertexCount] = verticesX[0];
	verticesY[vertexCount] = verticesY[0];

	for( var i = 0; i < vertexCount; i++ ) {
	    var edgeDeltaX = verticesX[i + 1] - verticesX[i];
	    var edgeDeltaY = verticesY[i + 1] - verticesY[i];
    
	    for( var j = 0; j < edgeEntityCount; j++ )
	    {
	        var xOffset = verticesX[i] + edgeDeltaX * j / edgeEntityCount;
	        var yOffset = verticesY[i] + edgeDeltaY * j / edgeEntityCount;
	        var entity = instance_create_layer( spawnX + xOffset, spawnY + yOffset, spawnLayer, oSpawnDummy );
	        entity.direction = point_direction( 0, 0, xOffset, yOffset );
	        entity.speed = spawnSpeed * point_distance( 0, 0, xOffset, yOffset );
			entity.Polygon = polygon;
			with( entity ) {
	        instance_change( spawnObj, true );
			}
	        polygon.Shift_Entities[i * edgeEntityCount + j] = entity;
	    }
	}
	return polygon;
}