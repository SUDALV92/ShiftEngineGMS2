// Change the alpha of an instance or all instances of an object.
// New instance commands override existing ones.
function instance_change_alpha( targetId, targetAlpha, duration, easingFunc = tween_linear ) 
{
	with( targetId ) {
	    var command = instance_create_depth( x, y, 0, oChangeAlphaCommand );
	    command.TargetId = id;
	    command.StartAlpha = image_alpha;
	    command.DeltaAlpha = targetAlpha - image_alpha;
	    command.Step = 0;
	    command.Duration = max( duration, 1 );
	    command.Smoother = easingFunc;
	    self.ShiftInternal_AlphaChangeCommand = command;
	}
}