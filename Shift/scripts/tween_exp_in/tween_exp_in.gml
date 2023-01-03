function tween_exp_in( beginValue, totalDelta, step, duration )
{
	return beginValue + totalDelta * power( 2, 10 * ( step / duration - 1 ) );
}