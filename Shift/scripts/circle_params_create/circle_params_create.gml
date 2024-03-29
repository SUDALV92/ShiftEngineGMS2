// Create a basic circle class.
// It can be filled with arbitrary data fields which will be available to circle instances
// throught the Circle data field.
// Parameters created with this method will regularly check if they are connected to any existing
// circle entities and destroy itself if no entities exist.
function circle_params_create()
{	
	var result = instance_create_depth( 0, 0, depth, oEntitiesShape );
	result.Creator = id;
	return result;
}
