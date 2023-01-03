function tween_sine_in( beginValue, totalDelta, step, duration )
{
	return beginValue + totalDelta - totalDelta * cos( ( pi / 2 ) * step / duration );
}