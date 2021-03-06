/// @description  tween_exp_inout( begin, totalDelta, step, duration );
/// @param  begin
/// @param  totalDelta
/// @param  step
/// @param  duration 
function tween_exp_inout(argument0, argument1, argument2, argument3) {
	var beginValue = argument0;
	var totalDelta = argument1;
	var step = argument2;
	var duration = argument3;

	step /= duration / 2;
	if( step < 1 ) {
	    return beginValue + totalDelta / 2 * power( 2, 10 * ( step - 1 ) );  
	} else {
	    return beginValue + totalDelta  / 2 * ( 2 - power( 2, -10 * ( step - 1 ) ) );
	}



}
