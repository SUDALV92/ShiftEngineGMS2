function tween_sine_out( beginValue, totalDelta, step, duration )
{
	return beginValue + totalDelta * sin( ( pi / 2 ) * step / duration );
}