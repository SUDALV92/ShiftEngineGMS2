// Change the Y scale of an instance or all instances of an object.
function instance_scale_y( targetId, targetScale, duration, easingFunc = tween_sine_inout ) 
{
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