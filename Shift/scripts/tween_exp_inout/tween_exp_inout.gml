function tween_exp_inout( beginValue, totalDelta, step, duration )
{
	step /= duration / 2;
	if( step < 1 ) {
	    return beginValue + totalDelta / 2 * power( 2, 10 * ( step - 1 ) );  
	} else {
	    return beginValue + totalDelta  / 2 * ( 2 - power( 2, -10 * ( step - 1 ) ) );
	}
}