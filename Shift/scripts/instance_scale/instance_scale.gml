// Change the X and Y scale of an instance or all instances of an object.
// New instance commands override existing ones.
function instance_scale( targetId, targetScale, duration, easingFunc = tween_sine_inout ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oScaleCommand );
	    command.TargetId = id;
	    command.StartScale = image_xscale;
	    command.ScaleDelta = targetScale - image_xscale;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_ScaleChangeCommand = command;
	}
}