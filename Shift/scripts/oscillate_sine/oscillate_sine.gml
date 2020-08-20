/// @description  oscillate_sine( minValue, maxValue, step, period );
/// @param  minValue
/// @param  maxValue
/// @param  step
/// @param  period 
function oscillate_sine(argument0, argument1, argument2, argument3) {
	var minValue = argument0;
	var maxValue = argument1;
	var step = argument2;
	var period = argument3;

	var relStep = step % period;
	return tween_return_sine_inout( minValue, maxValue - minValue, relStep, period );



}
