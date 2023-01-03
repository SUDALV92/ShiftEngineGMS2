function tween_quad_out( beginValue, totalDelta, step, duration )
{
	step /= duration;
	return beginValue - totalDelta * step * ( step - 2 );
}