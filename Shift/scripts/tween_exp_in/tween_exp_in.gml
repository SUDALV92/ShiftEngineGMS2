/// @description  tween_exp_in( begin, totalDelta, step, duration );
/// @param  begin
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tween_exp_in(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	return beginValue + totalDelta * power( 2, 10 * ( step / duration - 1 ) );



}
