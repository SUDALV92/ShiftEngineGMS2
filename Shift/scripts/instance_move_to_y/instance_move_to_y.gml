// Move an instance or all instances of an object to a given Y position.
// New instance commands override existing ones.
function instance_move_to_y( targetId, targetY, duration, easingFunc = tween_sine_inout ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oMoveYCommand );
	    command.TargetId = id;
	    command.DeltaY = targetY - y;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_MoveYCommand = command;
	}
}