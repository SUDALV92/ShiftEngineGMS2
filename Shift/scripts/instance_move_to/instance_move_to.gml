// Move an instance or all instances of an object to a given position.
// New instance commands override existing ones.
function instance_move_to( targetId, targetX, targetY, duration, easingFunc = tween_sine_inout ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oMoveCommand );
	    command.TargetId = id;
	    command.DeltaX = targetX - x;
	    command.DeltaY = targetY - y;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_MoveCommand = command;
	}
}