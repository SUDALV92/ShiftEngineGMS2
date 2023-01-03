function tween_return_sine_inout( beginValue, totalDelta, step, duration )
{
	var hDuration = duration / 2;
	if( step <= hDuration ) {
	    return tween_sine_inout( beginValue, totalDelta, step, hDuration );
	} else {
	    return tween_sine_inout( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
	}
}