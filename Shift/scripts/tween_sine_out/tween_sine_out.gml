/// @description  tween_sine_out( beginValue, totalDelta, step, duration );
/// @param  beginValue
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tween_sine_out(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	return beginValue + totalDelta * sin( ( pi / 2 ) * step / duration );



}
