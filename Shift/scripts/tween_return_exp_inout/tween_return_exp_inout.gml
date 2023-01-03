function tween_return_exp_inout( beginValue, totalDelta, step, duration )
{
	var hDuration = duration / 2;
	if( step <= hDuration ) {
	    return tween_exp_inout( beginValue, totalDelta, step, hDuration );
	} else {
	    return tween_exp_inout( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
	}
}