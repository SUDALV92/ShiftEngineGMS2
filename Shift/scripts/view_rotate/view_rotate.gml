function view_rotate( targetAngle, duration, smoother = tween_sine_inout )
{
	var cam = view_get_camera(0);
	var command = instance_create_depth( 0, 0, 0, oViewRotateCommand );
	command.StartAngle = camera_get_view_angle(cam);
	command.AngleDelta = targetAngle - command.StartAngle;
	command.Step = 0;
	command.Duration = duration;
	command.Smoother = smoother;
}
