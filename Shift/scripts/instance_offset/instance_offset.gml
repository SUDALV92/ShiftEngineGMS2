// Offset an instance or all instances of an object by a given vector.
// New instance commands override existing ones.
function instance_offset( targetId, deltaX, deltaY, duration, easingFunc = tween_sine_inout ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oMoveCommand );
	    command.TargetId = id;
	    command.DeltaX = deltaX;
	    command.DeltaY = deltaY;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_MoveCommand = command;
	}
}