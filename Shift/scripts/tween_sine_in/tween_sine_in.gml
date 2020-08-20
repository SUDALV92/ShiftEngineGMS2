/// @description  tween_sine_in( begin, totalDelta, step, duration );
/// @param  begin
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tween_sine_in(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	return beginValue + totalDelta - totalDelta * cos( ( pi / 2 ) * step / duration );



}
