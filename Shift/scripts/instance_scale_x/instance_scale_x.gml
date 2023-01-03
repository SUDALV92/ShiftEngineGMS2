// Change the X scale of an instance or all instances of an object.
function instance_scale_x( targetId, targetScale, duration, easingFunc = tween_sine_inout ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oScaleXCommand );
	    command.TargetId = id;
	    command.StartScaleX = image_xscale;
	    command.ScaleDeltaX = targetScale - image_xscale;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_XScaleChangeCommand = command;
	}
}