function tween_linear( beginValue, totalDelta, step, duration )
{
	return beginValue + totalDelta * step / duration;
}