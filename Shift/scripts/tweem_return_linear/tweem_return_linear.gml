/// @description  tweem_return_linear( beginValue, totalDelta, step, duration );
/// @param  beginValue
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tweem_return_linear(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	var hDuration = duration / 2;
	if( step <= hDuration ) {
	    return tween_linear( beginValue, totalDelta, step, hDuration );
	} else {
	    return tween_linear( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
	}



}
