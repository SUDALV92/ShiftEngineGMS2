Step++;
var cam = view_get_camera(0);
if( Step >= Duration ) {
	
	camera_set_view_angle( cam, script_execute( Smoother, StartAngle, AngleDelta, Duration, Duration ) );
    instance_destroy();
}
camera_set_view_angle( cam, script_execute( Smoother, StartAngle, AngleDelta, Step, Duration ) );