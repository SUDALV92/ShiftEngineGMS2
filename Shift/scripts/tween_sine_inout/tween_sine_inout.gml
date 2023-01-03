function tween_sine_inout( beginValue, totalDelta, step, duration ) 
{
	return beginValue - totalDelta / 2 * ( cos( pi * step / duration ) - 1 );
}