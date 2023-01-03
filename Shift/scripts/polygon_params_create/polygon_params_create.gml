// Create a basic polygon class.
// It can be filled with arbitrary data fields which will be available to ppolygon instances
// throught the Polygon data field.
// Parameters created with this method will regularly check if they are connected to any existing
// circle entities and destroy itself if no entities exist.
function polygon_params_create()
{	
	return circle_params_create();
}