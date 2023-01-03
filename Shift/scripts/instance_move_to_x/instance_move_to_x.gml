// Move an instance or all instances of an object to a given X position.
// New instance commands override existing ones.
function instance_move_to_x( targetId, targetX, duration, easingFunc = tween_sine_inout )
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oMoveXCommand );
	    command.TargetId = id;
	    command.DeltaX = targetX - x;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_MoveXCommand = command;
	}
}