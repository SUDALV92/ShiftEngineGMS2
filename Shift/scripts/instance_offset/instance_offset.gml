/// @description  instance_offset( targetId, deltaX, deltaY, duration, easingFunc = tween_sine_inout )
/// @param  targetId
/// @param  deltaX
/// @param  deltaY
/// @param  duration
/// @param  easingFunc = tween_sine_inout 
function instance_offset() {
	// Offset an instance or all instances of an object by a given vector.
	// New instance commands override existing ones.
	var targetId = argument[0];
	var deltaX = argument[1];
	var deltaY = argument[2];
	var duration = argument[3];

	var easingFunc = tween_sine_inout;
	if( argument_count > 4 ) {
	    easingFunc = argument[4];
	}

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
