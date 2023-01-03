// Instantly set both x and y scale of a given instance or all instances of a given object.
function instance_set_scale( targetId, targetScale ) 
{
	with( targetId ) {
	    image_xscale = targetScale;
	    image_yscale = targetScale;
	}
}