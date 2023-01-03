function tweem_return_linear( beginValue, totalDelta, step, duration )
{
	var hDuration = duration / 2;
	if( step <= hDuration ) {
	    return tween_linear( beginValue, totalDelta, step, hDuration );
	} else {
	    return tween_linear( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
	}
}