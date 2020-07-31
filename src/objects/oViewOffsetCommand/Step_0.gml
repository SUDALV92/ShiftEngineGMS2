Step++;
var cam = view_get_camera(0);
if( Step >= Duration ) {
    var smoothVal = script_execute( Smoother, 0, 1, Duration, Duration );
    camera_set_view_pos( cam, StartX + smoothVal * MaxX, StartY + smoothVal * MaxY );
    instance_destroy();
}
var smoothVal = script_execute( Smoother, 0, 1, Step, Duration );
camera_set_view_pos( cam, StartX + smoothVal * MaxX, StartY + smoothVal * MaxY );


