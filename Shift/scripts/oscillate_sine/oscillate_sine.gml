function oscillate_sine( minValue, maxValue, step, period )
{
	var relStep = step % period;
	return tween_return_sine_inout( minValue, maxValue - minValue, relStep, period );
}