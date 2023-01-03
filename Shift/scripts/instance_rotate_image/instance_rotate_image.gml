// Change the image angle of an instance or all instances of an object.
function instance_rotate_image( targetId, targetAngle, duration, easingFunc = tween_sine_inout ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oRotateImageCommand );
	    command.TargetId = id;
	    command.StartDirection = image_angle;
	    command.DeltaDirection = targetAngle - image_angle;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_RotateImageCommand = command;
	}
}