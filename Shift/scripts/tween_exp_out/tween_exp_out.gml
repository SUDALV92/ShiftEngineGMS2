function tween_exp_out( beginValue, totalDelta, step, duration ) 
{
	return beginValue + totalDelta * ( 1 - power( 2, -10 * step / duration ) );
}