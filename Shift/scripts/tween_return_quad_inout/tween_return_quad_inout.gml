function tween_return_quad_inout( beginValue, totalDelta, step, duration )
{
	var hDuration = duration / 2;
	if( step <= hDuration ) {
	    return tween_quad_inout( beginValue, totalDelta, step, hDuration );
	} else {
	    return tween_quad_inout( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
	}
}