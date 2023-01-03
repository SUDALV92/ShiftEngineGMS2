function instance_redirect( targetId, targetAngle, duration, easingFunc = tween_sine_inout ) 
{
	// Change the direction of an instance or all instances of an object.
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oChangeDirectionCommand );
	    command.TargetId = id;
	    command.StartDirection = direction;
	    command.DeltaDirection = targetAngle - direction;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_ChangeDirectionCommand = command;
	}
}