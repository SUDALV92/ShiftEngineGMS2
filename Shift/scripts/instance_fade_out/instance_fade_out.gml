// Gradually lower the alpha value of all instances with the given targetId.
// When the alpha reaches zero, destroy them.
// Fade duration represents the maximum possible duration for fully opaque instances.
// If an instance is already partially transparent, it will disappear quicker.
function instance_fade_out( targetId, fadeDuration ) 
{	
	fadeDuration = max( fadeDuration, 1 );

	var newCommand = instance_create_depth( 0, 0, 0, oFadeCommand );
	newCommand.AlphaDelta = 1 / fadeDuration;

	var fadeCount = 0;
	with( targetId ) {
	    newCommand.FadeList[fadeCount] = id;
	    fadeCount++;
	}
	newCommand.FadeCount = fadeCount;
	newCommand.alarm[0] = fadeDuration;
}