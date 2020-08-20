/// @description  tween_return_quad_inout( beginValue, totalDelta, step, duration );
/// @param  beginValue
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tween_return_quad_inout(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	var hDuration = duration / 2;
	if( step <= hDuration ) {
	    return tween_quad_inout( beginValue, totalDelta, step, hDuration );
	} else {
	    return tween_quad_inout( beginValue + totalDelta, -totalDelta, step - hDuration, hDuration );
	}



}
