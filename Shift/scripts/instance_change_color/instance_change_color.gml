// Change the color of an instance or all instances of an object.
// New instance commands override existing ones.
function instance_change_color( targetId, targetColor, duration, easingFunc = tween_linear ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oChangeColorCommand );
	    command.TargetId = id;
	    command.StartColor = image_blend;
	    command.EndColor = targetColor;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_ColorChangeCommand = command;
	}
}