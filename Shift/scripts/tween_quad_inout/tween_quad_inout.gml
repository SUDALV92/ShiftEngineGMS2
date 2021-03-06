/// @description  tween_quad_inout( beginValue, totalDelta, step, duration );
/// @param  beginValue
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tween_quad_inout(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	step /= duration / 2;
	var hDelta = totalDelta / 2;
	if( step < 1 ) {
	    return beginValue + hDelta * step * step;
	}
	return beginValue - hDelta * ( step * ( step - 2 ) - 1 );



}
