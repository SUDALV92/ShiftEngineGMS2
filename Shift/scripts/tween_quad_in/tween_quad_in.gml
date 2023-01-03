function tween_quad_in( beginValue, totalDelta, step, duration )
{
	step /= duration;
	return beginValue + totalDelta * step * step;
}