function view_offset( targetX, targetY, duration, smoother = tween_sine_inout ) 
{
	var cam = view_get_camera(0);
	var command = instance_create_depth( 0, 0, 0, oViewOffsetCommand );
	command.StartX = camera_get_view_x(cam);
	command.StartY = camera_get_view_y(cam);
	command.MaxX = targetX - command.StartX;
	command.MaxY = targetY - command.StartY;
	command.Step = 0;
	command.Duration = duration;
	command.Smoother = smoother;
}
