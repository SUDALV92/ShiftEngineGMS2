/// @description  instance_scale_y( targetId, targetScale, duration, easingFunc = tween_sine_inout )
/// @param  targetId
/// @param  targetScale
/// @param  duration
/// @param  easingFunc = tween_sine_inout 
function instance_scale_y() {
	// Change the Y scale of an instance or all instances of an object.
	var targetId = argument[0];
	var targetScale = argument[1];
	var duration = argument[2];

	var easingFunc = tween_sine_inout;
	if( argument_count > 3 ) {
	    easingFunc = argument[3];
	}

	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oScaleYCommand );
	    command.TargetId = id;
	    command.StartScaleY = image_yscale;
	    command.ScaleDeltaY = targetScale - image_yscale;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_YScaleChangeCommand = command;
	}



}
